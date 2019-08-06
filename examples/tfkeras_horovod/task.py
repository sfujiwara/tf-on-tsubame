import tensorflow as tf
import numpy as np
# import horovod.tensorflow.keras as hvd


def load_dataset():

    (x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
    x_train, x_test = np.expand_dims(x_train, axis=3), np.expand_dims(x_test, axis=3)

    def train_dataset():
        ds = tf.data.Dataset.from_tensor_slices((x_train, y_train))
        ds = ds.map(lambda x: (tf.cast(x[0], tf.float32)/255., x[1]))
        ds = ds.repeat().shuffle(1024).batch(32)
        # ds = ds.prefetch(tf.data.experimental.AUTOTUNE)
        return ds
    
    def eval_dataset():
        ds = tf.data.Dataset.from_tensor_slices((x_test, y_test))
        ds = ds.map(lambda x: (tf.cast(x[0], tf.float32)/255., x[1]))
        ds = ds.repeat().batch(100)
        # ds = ds.prefetch(tf.data.experimental.AUTOTUNE)
        return ds
    
    return train_dataset(), eval_dataset()


def create_model():

    model = tf.keras.Sequential([
        tf.keras.layers.Conv2D(32, (3, 3), activation='relu', input_shape=(28, 28, 1)),
        tf.keras.layers.Conv2D(64, (3, 3), activation='relu'),
        tf.keras.layers.MaxPool2D(pool_size=(2, 2)),
        tf.keras.layers.Dropout(rate=0.75),
        tf.keras.layers.Flatten(),
        tf.keras.layers.Dense(128, activation='relu'),
        tf.keras.layers.Dropout(rate=0.5),
        tf.keras.layers.Dense(10, activation='softmax')
    ])

    return model


def main():

    # Initialize horovod
    hvd.init()

    model = create_model()

    # Wrap keras optimizer with horovod distributed optimizer
    optimizer = tf.keras.optimizers.SGD(lr=0.01, nesterov=True)
    optimizer = hvd.DistributedOptimizer(optimizer)

    model.compile(
        optimizer=optimizer,
        loss='sparse_categorical_crossentropy',
        metrics=['accuracy']
    )

    ds_train, ds_eval = load_dataset()
    print(ds_train, ds_eval)

    callbacks = [
        # Horovod: broadcast initial variable states from rank 0 to all other processes.
        # This is necessary to ensure consistent initialization of all workers when
        # training is started with random weights or restored from a checkpoint.
        hvd.callbacks.BroadcastGlobalVariablesCallback(0),

        # Horovod: average metrics among workers at the end of every epoch.
        #
        # Note: This callback must be in the list before the ReduceLROnPlateau,
        # TensorBoard or other metrics-based callbacks.
        hvd.callbacks.MetricAverageCallback(),

        # Horovod: using `lr = 1.0 * hvd.size()` from the very beginning leads to worse final
        # accuracy. Scale the learning rate `lr = 1.0` ---> `lr = 1.0 * hvd.size()` during
        # the first three epochs. See https://arxiv.org/abs/1706.02677 for details.
        hvd.callbacks.LearningRateWarmupCallback(warmup_epochs=3, verbose=1),
    ]

    # Horovod: save checkpoints only on worker 0 to prevent other workers from corrupting them.
    if hvd.rank() == 0:
        callbacks.append(tf.keras.callbacks.ModelCheckpoint('./checkpoint-{epoch}.h5'))

    # Horovod: write logs on worker 0.
    verbose = 1 if hvd.rank() == 0 else 0

    model.fit(
        ds_train,
        epochs=5,
        steps_per_epoch=int(60000/32),
        validation_data=ds_eval,
        validation_steps=100,
        callbacks=callbacks,
    )


if __name__ == '__main__':
    main()

package com.example.basickotlin.MVVM.di



object AppModule {
    val movieLocalDataSource: MovieLocalDataSource by lazy { MovieInMemoryStorage() }

    val movieRemoteDataSource: MovieRemoteDataSource by lazy { MovieServer() }

    val movieRepository: MovieRepository by lazy {
        MovieRepository(movieLocalDataSource, movieRemoteDataSource)
    }
}
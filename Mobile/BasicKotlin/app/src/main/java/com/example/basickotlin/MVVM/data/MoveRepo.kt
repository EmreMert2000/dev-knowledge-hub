package com.example.basickotlin.MVVM.data



import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.onStart

import kotlin.time.Duration.Companion.seconds
import kotlin.time.ExperimentalTime


@OptIn(ExperimentalTime::class)
class MovieRepository(
    private val movieLocalDataSource: MovieLocalDataSource,
    private val movieRemoteDataSource: MovieRemoteDataSource,
) {
    val movies: Flow<List<Movie>> = movieLocalDataSource.movies.onStart { syncMoviesIfNecessary() }

    suspend fun getMovie(movieId: String): Movie = movieLocalDataSource.getMovieById(movieId)

    private var latestSyncTime = Instant.DISTANT_PAST

    private suspend fun syncMoviesIfNecessary() {
        val isOutdated: Boolean = (System.now() - latestSyncTime) > 10.seconds

        if (isOutdated) {
            val remoteMovies: List<Movie> = movieRemoteDataSource.getMovies()
            movieLocalDataSource.saveMovies(remoteMovies)
            latestSyncTime = System.now()
        }
    }
}
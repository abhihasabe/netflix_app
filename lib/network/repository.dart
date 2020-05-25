import 'dart:async';

import 'package:netflix_ui_change_app/model/item_model.dart';
import 'package:netflix_ui_change_app/model/movie_category_model.dart';
import 'package:netflix_ui_change_app/model/movie_detail_model.dart';
import 'package:netflix_ui_change_app/model/movie_image_model.dart';

import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieDetailModel> fetchMovieDetail(int movieId) => moviesApiProvider.fetchMovieDetail(movieId);

  Future<MovieImageModel> fetchMovieImages(int movieId) => moviesApiProvider.fetchMovieImages(movieId);

  Future<ItemModel> fetchMovieList(String type) => moviesApiProvider.fetchMovieList(type);

  Future<MovieCategoryModel> fetchMovieCategoryList(String type) => moviesApiProvider.fetchMovieCategoryList(type);


}
import 'package:netflix_ui_change_app/model/movie_image_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base.dart';


class MovieImageBloc extends BaseBloc<MovieImageModel> {

  Observable<MovieImageModel> get movieImages => topRatedMovieFetcher.stream;

  fetchMovieImages(int movieId) async {
    MovieImageModel itemModel = await repository.fetchMovieImages(movieId);
    topRatedMovieFetcher.sink.add(itemModel);
  }
}

final movieImageBloc = MovieImageBloc();
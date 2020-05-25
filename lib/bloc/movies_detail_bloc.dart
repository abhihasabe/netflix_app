
import 'package:netflix_ui_change_app/model/movie_detail_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base.dart';

class MovieDetailBloc extends BaseBloc<MovieDetailModel> {

  Observable<MovieDetailModel> get movieDetail => topRatedMovieFetcher.stream;

  fetchMovieDetail(int movieId) async {
    MovieDetailModel itemModel = await repository.fetchMovieDetail(movieId);
    topRatedMovieFetcher.sink.add(itemModel);
  }
}

final movieDetailBloc = MovieDetailBloc();
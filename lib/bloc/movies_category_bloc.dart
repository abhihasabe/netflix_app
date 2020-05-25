
import 'package:netflix_ui_change_app/model/movie_category_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base.dart';


class MovieCategoryBloc extends BaseBloc<MovieCategoryModel> {

  Observable<MovieCategoryModel> get movieList => topRatedMovieFetcher.stream;

  fetchMovieCategoryList(String type) async {
    MovieCategoryModel itemModel = await repository.fetchMovieCategoryList(type);
    topRatedMovieFetcher.sink.add(itemModel);
  }
}

final movieCategoryListBloc = MovieCategoryBloc();
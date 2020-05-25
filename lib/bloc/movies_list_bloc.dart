import 'package:netflix_ui_change_app/model/item_model.dart';
import 'package:rxdart/rxdart.dart';
import 'base.dart';

class MovieListBloc extends BaseBloc<ItemModel> {
  Observable<ItemModel> get TopRatedMovieList => topRatedMovieFetcher.stream;

  Observable<ItemModel> get UpcomingMovieList => upcomingMovieFetcher.stream;

  Observable<ItemModel> get NowPlayingMovieList =>
      nowPlayingMovieFetcher.stream;

  Observable<ItemModel> get movieList => movieFetcher.stream;

  fetchTopRatedMovieList(String type) async {
    ItemModel itemModel = await repository.fetchMovieList(type);
    topRatedMovieFetcher.sink.add(itemModel);
  }

  fetchUpcomingMovieList(String type) async {
    ItemModel itemModel = await repository.fetchMovieList(type);
    upcomingMovieFetcher.sink.add(itemModel);
  }

  fetchNowPlayingMovieList(String type) async {
    ItemModel itemModel = await repository.fetchMovieList(type);
    nowPlayingMovieFetcher.sink.add(itemModel);
  }

  fetchCategoryMovieList(String type) async {
    ItemModel itemModel = await repository.fetchMovieList(type);
    movieFetcher.sink.add(itemModel);
  }
}

final movieListBloc = MovieListBloc();

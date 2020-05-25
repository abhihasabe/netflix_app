
import 'package:netflix_ui_change_app/model/base_model.dart';
import 'package:netflix_ui_change_app/network/repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends BaseModel> {
  final repository = Repository();
  final topRatedMovieFetcher = PublishSubject<T>();
  final upcomingMovieFetcher = PublishSubject<T>();
  final nowPlayingMovieFetcher = PublishSubject<T>();
  final movieFetcher = PublishSubject<T>();

  dispose() {
    topRatedMovieFetcher.close();
    upcomingMovieFetcher.close();
    nowPlayingMovieFetcher.close();
    movieFetcher.close();
  }
}
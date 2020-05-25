import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netflix_ui_change_app/constant/strings.dart';
import 'package:netflix_ui_change_app/ui/widget/movie_category.dart';
import 'package:netflix_ui_change_app/ui/widget/movie_list.dart';
import 'package:netflix_ui_change_app/ui/widget/slideshow.dart';
import 'package:netflix_ui_change_app/utils/Network.dart';
import 'package:netflix_ui_change_app/utils/my_scroll_behavior.dart';
import 'detail_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      debounceDuration: Duration.zero,
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          return Scaffold(
              body: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                Center(
                  child: Text('Please check internet connection!',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: RaisedButton(
                      color: Color(0xffee1c3c),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      elevation: 4.0,
                      child: Text("RETRY",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Network().check().then((intenet) {
                          if (intenet != null && intenet) {
                            // Internet Present Case

                          } else {
                            // No-Internet Case
                            Fluttertoast.showToast(
                              msg:
                                  "No internet connection available please turn on your data or Wi-Fi",
                            );
                          }
                        });
                      },
                    ),
                  ),
                )
              ])));
        }
        return child;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              "res/images/icon_netflix.png",
              height: 100,
            ),
          ),
          centerTitle: true,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black, // Here
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: ScrollConfiguration(
            behavior: MyScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SlideShowView(
                    onItemInteraction: (movieId) {
                      _navigateToMovieDetail(context, movieId);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  MovieCategory(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  _buildMyList(context),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  _buildPopularList(context),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  _buildUpcomingList(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildMyList(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Latest Movies",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Muli"),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                )
              ],
            ),
          ),
          MovieListView(
            type: MovieListType.popular,
            onItemInteraction: (movieId) {
              _navigateToMovieDetail(context, movieId);
            },
          )
        ],
      ),
    );
  }

  _buildPopularList(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Top Rated Movies",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Muli"),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                )
              ],
            ),
          ),
          MovieListView(
            type: MovieListType.topRated,
            onItemInteraction: (movieId) {
              _navigateToMovieDetail(context, movieId);
            },
          )
        ],
      ),
    );
  }

  _buildUpcomingList(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Upcoming Movies",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Muli"),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                )
              ],
            ),
          ),
          MovieListView(
            type: MovieListType.upcoming,
            onItemInteraction: (movieId) {
              _navigateToMovieDetail(context, movieId);
            },
          )
        ],
      ),
    );
  }

  _navigateToMovieDetail(BuildContext context, int movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(movieId: movieId),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

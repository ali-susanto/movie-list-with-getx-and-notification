import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_getx/app/api/api_provider.dart';
import 'package:movie_list_getx/app/models/movie_model.dart';

class MovieListController extends GetxController with StateMixin {
  ApiProvider apiProvider = ApiProvider();
  List<Result> upcomingMovieList = [];
  List<Result> nowPlayingMovieList = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    getUpcomingMovieList();
    getNowPlayingMovieList();
  }

  void getUpcomingMovieList() async {
    isLoading = true;
    change(null, status: RxStatus.loading());
    try {
      var response = await apiProvider.getUpcomingMovie();
      if (response.statusCode == 200) {
        var dataMovie = MovieModel.fromJson(response.data);
        upcomingMovieList = dataMovie.results;
        update();
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error("Error to get data"));
    }
  }

  void getNowPlayingMovieList() async {
    change(null, status: RxStatus.loading());
    try {
      var response = await apiProvider.getNowPlayingMovie();
      // print(response.data.toString());
      if (response.statusCode == 200) {
        var responseData = MovieModel.fromJson(response.data);
        nowPlayingMovieList = responseData.results;
        update();
        change(null, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error('Failed to get data'));
    }
  }
}

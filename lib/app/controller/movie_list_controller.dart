import 'package:get/get.dart';
import 'package:movie_list_getx/app/api/api_provider.dart';
import 'package:movie_list_getx/app/models/movie_model.dart';

class MovieListController extends GetxController {
  ApiProvider apiProvider = ApiProvider();
  List<Result> movieList = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    getMovieList();
  }

  void getMovieList() async {
    var response = await apiProvider.getMovie();
    if (response.statusCode == 200) {
      var dataMovie = MovieModel.fromJson(response.data);
      movieList = dataMovie.results;
      isLoading = false;
      update();
    }
  }
}

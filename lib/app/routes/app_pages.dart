import 'package:get/get.dart';
import 'package:movie_list_getx/app/modules/movie_detail/movie_detail_screen.dart';
import 'package:movie_list_getx/app/modules/movie_list/movie_list_screen.dart';
import 'package:movie_list_getx/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.movieList, page: () => const MovieListScreen()),
    GetPage(name: AppRoutes.movieDetail, page: () => const MovieDetailScreen()),
  ];
}

import 'package:get/get.dart';
import 'package:movie_list_getx/app/controller/movie_list_controller.dart';

class MovieListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieListController());
  }
}

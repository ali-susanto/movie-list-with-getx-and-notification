import 'package:dio/dio.dart';
import 'package:movie_list_getx/app/utils/constant.dart';

class ApiProvider {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));
  Future<Response> getUpcomingMovie() async {
    final response = await dio.get('/movie/upcoming',
        options: Options(headers: {'Authorization': 'Bearer $bearerToken'}));
    return response;
  }

  Future<Response> getNowPlayingMovie() async {
    final response = await dio.get('/movie/now_playing',
        options: Options(headers: {'Authorization': 'Bearer $bearerToken'}));
    return response;
  }

  Future<Response> getMovieDetail({required int idMovie}) async {
    final response = await dio.get('/movie/$idMovie',
        options: Options(headers: {'Authorization': 'Bearer $bearerToken'}));
    return response;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_getx/app/controller/movie_list_controller.dart';
import 'package:movie_list_getx/app/routes/app_routes.dart';
import '../component/content_card.dart';

class HomeScreen extends GetView<MovieListController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieKu'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: controller.obx((state) {
            return SingleChildScrollView(
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.getNowPlayingMovieList();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Upcoming Movie',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.movieList);
                              },
                              child: const Text('lainnya >'))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 0,
                            crossAxisCount: 3,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: controller.movieList.getRange(1, 7).length,
                          itemBuilder: (context, index) {
                            return ContentCard(
                                size: size,
                                urlImage:
                                    controller.movieList[index].posterPath,
                                movieTitle: controller.movieList[index].title);
                          })
                    ],
                  ),
                ),
              ),
            );
          }, onLoading: const CircularProgressIndicator())),
    );
  }
}

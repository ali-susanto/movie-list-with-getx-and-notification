import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_getx/app/controller/movie_list_controller.dart';
import 'package:movie_list_getx/app/routes/app_routes.dart';
import 'package:movie_list_getx/app/utils/constant.dart';
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
      body: controller.obx((state) {
        return SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () async {
              controller.getNowPlayingMovieList();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(left: 10.0),
                    child:  Text(
                      'Now Playing',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CarouselSlider(
                    items: controller.nowPlayingMovieList.map((e) {
                      return Container(
                        height: size.height * 0.2,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                              child: Image.network(
                                imgPath + e.posterPath,
                                fit: BoxFit.fill,
                                height: 300,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                child: Column(
                                  children: [
                                    Text(e.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                        autoPlay: true, enlargeCenterPage: true),
                  ),
                  upcomingMovie(size),
                ],
              ),
            ),
          ),
        );
      }, onLoading: const CircularProgressIndicator()),
    );
  }

  Widget upcomingMovie(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Upcoming Movie',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.movieList);
                  },
                  child: const Text('lainnya >'))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              crossAxisCount: 3,
              childAspectRatio: 0.7,
            ),
            itemCount: controller.upcomingMovieList.getRange(1, 7).length,
            itemBuilder: (context, index) {
              return ContentCard(
                  size: size,
                  urlImage: controller.upcomingMovieList[index].posterPath,
                  movieTitle: controller.upcomingMovieList[index].title);
            })
      ],
    );
  }
}

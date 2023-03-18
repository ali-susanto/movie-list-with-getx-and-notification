import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_getx/app/controller/movie_list_controller.dart';

import '../../utils/constant.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<MovieListController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('MovieKu'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Upcoming Movie'),
                        const SizedBox(
                          height: 10,
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: controller.movieList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: SizedBox(
                                          height: size.width * 0.3,
                                          width: size.width * 0.25,
                                          child: Image.network(
                                            imgPath +
                                                controller.movieList[index]
                                                    .posterPath,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(controller.movieList[index].title)
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

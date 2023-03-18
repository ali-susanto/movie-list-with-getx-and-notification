import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_list_getx/app/modules/home/home_screen.dart';
import 'package:movie_list_getx/app/modules/movie_list/movie_list_screen.dart';
import 'package:movie_list_getx/app/routes/app_pages.dart';

import 'app/modules/movie_list/movie_list_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      initialBinding: MovieListBinding(),
      getPages: AppPages.pages,
    );
  }
}

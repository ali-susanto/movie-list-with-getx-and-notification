import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.size,
    required this.urlImage,
    required this.movieTitle
  });

  final Size size;
  final String urlImage;
  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: size.width * 0.3,
            width: size.width * 0.25,
            child: Image.network(
              imgPath +
                  urlImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          movieTitle,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}

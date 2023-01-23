import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_movies_app/core/utils/app_values.dart';
import 'package:responsive_movies_app/core/utils/media_query_values.dart';

class ScreenImage extends StatelessWidget {
  final String title;
  final String image;

  const ScreenImage({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: context.height * AppSize.s0_0_3),
        SvgPicture.asset(
          image,
          height: context.height * AppSize.s0_3_5,
        ),
        SizedBox(height: context.height * AppSize.s0_0_3),
      ],
    );
  }
}

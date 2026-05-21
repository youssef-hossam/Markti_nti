
import 'package:flutter/material.dart';

class OnBoardingPageViewModel extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String body;
  const OnBoardingPageViewModel({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageAsset),
        Text(title),
        Text(body),
      ],
    );
  }
}


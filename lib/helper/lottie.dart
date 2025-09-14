import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends StatelessWidget {
  final bool isLottieHeight;
  final double? lottieHeight;
  const CustomLottie({
    super.key,
    required this.isLottieHeight,
    this.lottieHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/button.json',
      height: isLottieHeight ? lottieHeight : 80,
    );
  }
}

class CustomLottieWithBackDropProgressIndicatorBar extends StatelessWidget {
  const CustomLottieWithBackDropProgressIndicatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: CustomLottie(isLottieHeight: false),
      ),
    );
  }
}

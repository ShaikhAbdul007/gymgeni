import 'package:flutter/material.dart';
import 'package:gymgeni/helper/lottie.dart';
import 'package:gymgeni/utils/text_style.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double? lottieHeight;
  final double width;
  final String label;
  final bool isLoading;
  final bool isOperationPerform;
  final bool isLottieHeight;
  final void Function() onPress;

  final Color color;

  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    this.isLoading = false,
    this.lottieHeight,
    this.isLottieHeight = false,
    required this.label,
    required this.onPress,
    this.color = AppColors.darkBackground,
    this.isOperationPerform = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: AppColors.whiteColor),
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      width: width,
      height: height,
      child: InkWell(
        onTap: isLoading ? null : onPress,
        child: Center(
          child:
              isLoading
                  ? CircularProgressIndicator(
                    backgroundColor: AppColors.whiteColor,
                    color: AppColors.blackColor,
                  )
                  : Text(
                    label,
                    style: customMontserrat(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                  ),
        ),
      ),
    );
  }
}

class CustomButtonWithOutBackGroudColor extends StatelessWidget {
  final double height;
  final double? lottieHeight;
  final double width;
  final String label;
  final bool isLoading;
  final bool isOperationPerform;
  final bool isLottieHeight;
  final void Function() onPress;

  final Color color;

  const CustomButtonWithOutBackGroudColor({
    super.key,
    required this.height,
    required this.width,
    this.isLoading = false,
    this.lottieHeight,
    this.isLottieHeight = false,
    required this.label,
    required this.onPress,
    this.color = AppColors.whiteColor,
    this.isOperationPerform = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: AppColors.blackColor),
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      width: width,
      height: height,
      child: InkWell(
        onTap: isLoading ? null : onPress,
        child: Center(
          child:
              isLoading
                  ? CircularProgressIndicator(
                    backgroundColor: AppColors.whiteColor,
                    color: AppColors.blackColor,
                  )
                  : Text(
                    label,
                    style: customMontserrat(
                      color: AppColors.darkBackground,
                      fontSize: 16,
                    ),
                  ),
        ),
      ),
    );
  }
}

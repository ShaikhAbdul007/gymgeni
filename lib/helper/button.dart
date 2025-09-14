import 'package:flutter/material.dart';
import 'package:gymgeni/helper/lottie.dart';
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
  final TextStyle? style;
  final Color color;

  const CustomButton(
      {super.key,
      required this.height,
      required this.width,
      this.isLoading = false,
      this.lottieHeight,
      this.isLottieHeight = false,
      required this.label,
      required this.onPress,
      this.color = AppColors.greyColor,
      this.isOperationPerform = false,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(8),
            color: color),
        width: width,
        height: height,
        child: InkWell(
          onTap: isLoading ? null : onPress,
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    backgroundColor: AppColors.whiteColor,
                    color: AppColors.blackColor,
                  )
                : Text(
                    label,
                    style: style,
                  ),
          ),
        ));
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  final double height;

  final double width;
  final String label;
  final IconData icons;
  final bool isLoading;
  final bool isIconRequired;
  final void Function() onPress;
  final bool isOperationPerform;

  const CustomButtonWithIcon({
    super.key,
    required this.height,
    required this.width,
    required this.label,
    required this.onPress,
    required this.icons,
    this.isLoading = false,
    this.isIconRequired = true,
    this.isOperationPerform = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CustomLottie(isLottieHeight: false)
        : SizedBox(
            width: width,
            height: height,
            child: ElevatedButton(
              onPressed: isOperationPerform
                  ? null
                  : isLoading
                      ? null
                      : onPress,
              child: Center(
                  child: Icon(
                icons,
              )),
            ));
  }
}

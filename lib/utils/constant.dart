import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/button.dart';
import 'colors.dart';
import 'divider.dart';
import 'sizebox.dart';
import 'text_style.dart';

class Constant {
  static getSnackBar({
    required String errorType,
    required String errorMessage,
    required bool isSuccess,
    Icon? iconChanged,
    bool isErrorIconChangeRequired = false,
    bool isInfo = false,
  }) {
    Get.rawSnackbar(
      borderColor:
          isInfo
              ? Colors.black87
              : isSuccess
              ? Colors.green.shade600
              : Colors.red.shade600,
      borderWidth: 1,
      borderRadius: 15,
      messageText: Text(
        errorMessage,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      animationDuration: Duration(seconds: 1),
      snackStyle: SnackStyle.FLOATING,
      icon:
          isInfo
              ? const Icon(Icons.info_outline, color: AppColors.blackColor)
              : isSuccess
              ? Icon(Icons.done, size: 25, color: Colors.green.shade600)
              : isErrorIconChangeRequired
              ? iconChanged
              : Icon(Icons.error_outline, size: 25, color: Colors.red.shade600),
      backgroundColor:
          isInfo
              ? Colors.grey.shade50
              : isSuccess
              ? Colors.green.shade50
              : Colors.red.shade50,
      snackPosition: SnackPosition.TOP,
    );
  }

  static tokenExpireActionButton({
    required void Function() onPress,
    required String alreatText,
  }) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Alert',
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      radius: 15,
      content: PopScope(canPop: false, child: Text(alreatText)),
      confirm: CustomButton(
        height: 40,
        width: 50,
        label: 'ok',
        onPress: onPress,
      ),
    );
  }

  static customShowDialog({
    required BuildContext context,
    required Widget? content,
    bool barrierDismissible = false,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          content: content!,
        );
      },
    );
  }

  static showCustomLAlert({
    required BuildContext context,
    required String errorMessage,
  }) {
    Constant.customShowDialog(
      context: context,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          setHeight(height: 20),
          Text(
            'Alert',
            textAlign: TextAlign.center,
            style: customMontserrat(fontSize: 15),
          ),
          setHeight(height: 10),
          customDivider(),
          setHeight(height: 10),
          Text(errorMessage, style: customPoppin(fontSize: 14)),
          setHeight(height: 10),
          CustomButton(
            height: 35,
            width: 100,
            label: 'close',
            onPress: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  static showGetDialogue({
    required TextStyle textStyle,
    required String titleText,
    required Widget content,
    bool barrierDismissible = false,
  }) {
    Get.defaultDialog(
      barrierDismissible: barrierDismissible,
      title: titleText,
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      titleStyle: textStyle,
      radius: 15,
      content: content,
    );
  }

  static void customPrintLog(logMessage) {
    if (kDebugMode) {
      print(logMessage);
    }
  }

  static showSnackBar({
    required BuildContext context,
    required String errorMessage,
    required bool? errorStatus,
  }) {
    final snackBar = SnackBar(
      content: Align(
        alignment: AlignmentGeometry.centerLeft,
        child: Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor:
                  errorStatus == true
                      ? AppColors.greenColor
                      : errorStatus == false
                      ? AppColors.redColor
                      : AppColors.yellowColor,
              child:
                  errorStatus == true
                      ? const Icon(Icons.done, color: Colors.white)
                      : errorStatus == false
                      ? const Icon(Icons.info, color: Colors.white)
                      : const Icon(Icons.info, color: Colors.white),
            ),
            setWidth(width: 8),
            Expanded(
              child: Text(
                errorMessage,
                style: customMontserrat(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      width: 300,
      backgroundColor: AppColors.whiteColor,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

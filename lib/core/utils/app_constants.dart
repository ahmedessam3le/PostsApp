import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/config/locale/app_localizations.dart';
import 'package:posts/core/utils/app_colors.dart';
import 'package:posts/core/utils/app_responsive.dart';

class AppConstants {
  static void showErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            message,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showToast({
    required String message,
    Color? toastColor,
    ToastGravity? toastGravity,
  }) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: toastColor ?? AppColors.primaryColor,
      gravity: toastGravity ?? ToastGravity.TOP,
      fontSize: 18.sp,
      textColor: Colors.white,
      msg: message,
    );
  }

  static Widget showLoadingIndicator() {
    return Center(
      child: SpinKitFadingCircle(
        color: AppColors.primaryColor,
      ),
    );
  }

  static Widget buildNoInternetWidget(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              color: Colors.red,
              size: 60,
            ),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.translate(
                  'please_check_your_internet_connection_and_try_again')!,
              style: TextStyle(fontSize: 20.sp, color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

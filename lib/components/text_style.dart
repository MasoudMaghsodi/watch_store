import 'package:flutter/material.dart';
import 'package:watch_store/gen/fonts.gen.dart';
import 'package:watch_store/res/colors.dart';

class LightAppTextStyle {
  LightAppTextStyle._();
  static const TextStyle title = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: AppColors.title,
  );
  static const TextStyle hint = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: AppColors.hint,
  );
  static const TextStyle avatarText = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 11,
    color: AppColors.title,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle mainButton = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    color: AppColors.mainButtonText,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle primaryThemeStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
  );
}

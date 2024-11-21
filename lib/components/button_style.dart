import 'package:flutter/material.dart';
import 'package:watch_store/res/dimens.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.medium,
        ),
      ),
    ),
  );
}

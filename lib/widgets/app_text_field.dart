import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/dimens.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  final String lable;
  final String prefixLable;
  final String hint;
  TextEditingController controller;
  final Widget? icon;
  final TextAlign textAlign;
  TextInputType? inputType;
  AppTextField({
    super.key,
    required this.lable,
    required this.hint,
    required this.controller,
    this.icon,
    this.textAlign = TextAlign.center,
    this.inputType,
    this.prefixLable = '',
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(AppDimens.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: size.width * .75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  prefixLable,
                  style: LightAppTextStyle.title,
                ),
                Text(
                  lable,
                  style: LightAppTextStyle.title,
                ),
              ],
            ),
          ),
          AppDimens.medium.height,
          SizedBox(
            height: size.height * .07,
            width: size.width * .75,
            child: TextField(
              textAlign: textAlign,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                hintStyle: LightAppTextStyle.hint,
                hintText: hint,
                prefixIcon: icon,
              ),
            ),
          )
        ],
      ),
    );
  }
}

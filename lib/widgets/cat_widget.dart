import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class CatWidget extends StatelessWidget {
  const CatWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.colors,
    required this.iconPath,
  });
  final String title;
  final VoidCallback onTap;
  final List<Color> colors;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimens.small),
            height: size.height * 0.1,
            width: size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.large),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 60,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: AppDimens.small * 0.5,
          ),
          Text(
            title,
            style: AppTextStyles.title.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

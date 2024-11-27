import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.onTap, required this.file});
  // ignore: prefer_typing_uninitialized_variables
  final onTap;
  // ignore: prefer_typing_uninitialized_variables
  final file;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: size.width * 0.3,
            height: size.width * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: file == null
                  ? Image.asset(
                      Assets.png.avatar.path,
                      fit: BoxFit.fill,
                    )
                  : Image.file(
                      file,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          AppDimens.medium.height,
          const Text(
            AppStrings.chooseProfileImage,
            style: AppTextStyles.avatarText,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/main_button.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.png.mainLogo.path),
              AppDimens.medium.height,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, "09305446900"),
                style: LightAppTextStyle.title,
              ),
              AppDimens.small.height,
              const Text(
                AppStrings.wrongNumberEditNumber,
                style: LightAppTextStyle.primaryThemeStyle,
              ),
              AppDimens.large.height,
              AppTextField(
                lable: AppStrings.enterVerificationCode,
                hint: AppStrings.hintVerificationCode,
                controller: _controller,
                prefixLable: "2:56",
              ),
              MainButton(
                text: AppStrings.next,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
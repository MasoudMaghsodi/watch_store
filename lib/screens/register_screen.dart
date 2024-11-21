import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/avatar.dart';
import 'package:watch_store/widgets/main_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController _controllerNameLastName = TextEditingController();
  final TextEditingController _controllerHomeNumber = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPostalCode = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              const Text(
                AppStrings.register,
                style: LightAppTextStyle.title,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppDimens.large.height,
                const Avatar(),
                AppTextField(
                  lable: AppStrings.nameLastName,
                  hint: AppStrings.hintNameLastName,
                  controller: _controllerNameLastName,
                ),
                AppTextField(
                  lable: AppStrings.homeNumber,
                  hint: AppStrings.hintHomeNumber,
                  controller: _controllerHomeNumber,
                ),
                AppTextField(
                  lable: AppStrings.address,
                  hint: AppStrings.hintAddress,
                  controller: _controllerAddress,
                ),
                AppTextField(
                  lable: AppStrings.postalCode,
                  hint: AppStrings.hintPostalCode,
                  controller: _controllerPostalCode,
                ),
                AppTextField(
                  lable: AppStrings.location,
                  hint: AppStrings.hintLocation,
                  controller: _controllerLocation,
                  icon: const Icon(Icons.add_location_outlined),
                ),
                MainButton(
                  text: AppStrings.next,
                  onPressed: () {},
                ),
                AppDimens.large.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

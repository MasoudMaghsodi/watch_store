import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route/names.dart';
import 'package:watch_store/utils/image_handler.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/avatar.dart';
import 'package:watch_store/widgets/main_button.dart';
import 'package:watch_store/widgets/registration_app_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerNameLastName = TextEditingController();

  final TextEditingController _controllerHomeNumber = TextEditingController();

  final TextEditingController _controllerAddress = TextEditingController();

  final TextEditingController _controllerPostalCode = TextEditingController();

  final TextEditingController _controllerLocation = TextEditingController();

  ImageHandler imageHandler = ImageHandler();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: RegistrationAppBar(size: size),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppDimens.large.height,
                Avatar(
                  onTap: () async => await imageHandler
                      .pickAndCropImage(
                        source: ImageSource.gallery,
                      )
                      .then(
                        (value) => setState(() {}),
                      ),
                  file: imageHandler.getImage,
                ),
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
                  onPressed: () =>
                      Navigator.pushNamed(context, ScreenNames.mainScreen),
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

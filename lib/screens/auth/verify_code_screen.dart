import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route/names.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/main_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  late Timer _timer;
  int _start = 120;
  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _timer.cancel();
          Navigator.of(context).pop();
        } else {
          _start--;
        }
      });
    });
  }

  String formatTime(int sec) {
    int min = sec ~/ 60;
    int remainSec = sec % 60;
    String minStr = min.toString().padLeft(2, '0');
    String secStr = remainSec.toString().padLeft(2, '0');
    return '$minStr:$secStr';
  }

  @override
  Widget build(BuildContext context) {
    final mobileRouteArg = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.png.mainLogo.path),
              AppDimens.medium.height,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, mobileRouteArg),
                style: AppTextStyles.title,
              ),
              AppDimens.small.height,
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  AppStrings.wrongNumberEditNumber,
                  style: AppTextStyles.primaryThemeTextStyle,
                ),
              ),
              AppDimens.large.height,
              AppTextField(
                inputType: TextInputType.number,
                lable: AppStrings.enterVerificationCode,
                hint: AppStrings.hintVerificationCode,
                controller: _controller,
                prefixLable: formatTime(_start),
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  _timer.cancel();
                  if (state is VerifyedNotRegisteredState) {
                    Navigator.pushNamed(context, ScreenNames.registerScreen);
                  } else if (state is VerifyedIsRegisteredState) {
                    Navigator.pushNamed(context, ScreenNames.mainScreen);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return MainButton(
                      text: AppStrings.next,
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .verifyCode(mobileRouteArg, _controller.text);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

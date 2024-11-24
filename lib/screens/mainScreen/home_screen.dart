import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_slider.dart';
import 'package:watch_store/widgets/cat_widget.dart';
import 'package:watch_store/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarBtn(
                onTap: () {},
              ),
              // carousel slider in home screen
              const AppSlider(
                imgList: [],
              ),
              // category under slider in home screen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CatWidget(
                    title: AppStrings.desktop,
                    onTap: () {},
                    colors: AppColors.catDesktopColors,
                    iconPath: Assets.svg.desktop,
                  ),
                  CatWidget(
                    title: AppStrings.digital,
                    onTap: () {},
                    colors: AppColors.catDigitalColors,
                    iconPath: Assets.svg.digital,
                  ),
                  CatWidget(
                    title: AppStrings.smart,
                    onTap: () {},
                    colors: AppColors.catSmartColors,
                    iconPath: Assets.svg.smart,
                  ),
                  CatWidget(
                    title: AppStrings.classic,
                    onTap: () {},
                    colors: AppColors.catClasicColors,
                    iconPath: Assets.svg.clasic,
                  ),
                ],
              ),
              AppDimens.large.height,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  children: [
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.all(AppDimens.small),
                          margin: const EdgeInsets.all(AppDimens.medium),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppDimens.medium),
                            gradient: const LinearGradient(
                              colors: AppColors.productBgGradiant,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          width: 200,
                          child: Column(
                            children: [
                              Image.asset(
                                Assets.png.unnamed.path,
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "ساعت مردانه",
                                  style: AppTextStyles.productTitle,
                                ),
                              ),
                              AppDimens.medium.height,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " ${63500.separateWithComma} تومان ",
                                        style: AppTextStyles.title,
                                      ),
                                      Text(
                                        122000.separateWithComma,
                                        style: AppTextStyles.oldPriceStyle,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(
                                        AppDimens.small * 0.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: Colors.red,
                                    ),
                                    child: const Text(" 20 % "),
                                  ),
                                ],
                              ),
                              AppDimens.large.height,
                              Container(
                                height: 2,
                                width: double.infinity,
                                color: Colors.blue,
                              ),
                              AppDimens.medium.height,
                              const Text(
                                " 09:26:22 ",
                                style: AppTextStyles.prodTimerStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const VerticalText(),
                  ],
                ),
              ),
              const SizedBox(
                height: AppDimens.large,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Row(
              children: [
                Transform.rotate(
                  angle: 1.5,
                  child: SvgPicture.asset(
                    Assets.svg.back,
                  ),
                ),
                AppDimens.small.width,
                const Text(
                  AppStrings.viewAll,
                )
              ],
            ),
            AppDimens.medium.height,
            const Text(
              AppStrings.amazing,
              style: AppTextStyles.amazingStyle,
            )
          ],
        ),
      ),
    );
  }
}

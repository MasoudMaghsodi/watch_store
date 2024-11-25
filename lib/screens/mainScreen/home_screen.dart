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
import 'package:watch_store/widgets/product_item.dart';
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
                        itemBuilder: (context, index) => const ProductItem(
                          productName: " ساعت مردانه ",
                          productPrice: 63500,
                          discount: 20,
                          productOldPrice: 122000,
                          time: 200,
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

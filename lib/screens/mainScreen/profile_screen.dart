import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.profile,
              style: AppTextStyles.title,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDimens.large.height,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.asset(Assets.png.avatar.path),
                  ),
                  AppDimens.medium.height,
                  const Text(
                    "مسعود مقصودی",
                    style: AppTextStyles.avatarText,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.activeAddress,
                      style: AppTextStyles.title,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.svg.leftArrow,
                        ),
                        const Expanded(
                          child: Text(
                            AppStrings.lurem,
                            style: AppTextStyles.title,
                            softWrap: true,
                            maxLines: 2,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDimens.small.height,
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: AppColors.surfaceColor,
                  ),
                  ProfileItem(
                    svgIcon: Assets.svg.postalCode,
                    content: "5971737554",
                  ),
                  ProfileItem(
                    svgIcon: Assets.svg.phone,
                    content: "09305446900",
                  ),
                  ProfileItem(
                    svgIcon: Assets.svg.userMenu,
                    content: "مسعود مقصودی",
                  ),
                  const SurfaceContainer(
                    child: Text(
                      AppStrings.termOfService,
                      style: AppTextStyles.title,
                    ),
                  ),
                  const SurfaceContainer(
                    child: ProductProccess(),
                  ),
                  AppDimens.large.height,
                  Image.asset(Assets.png.mainLogo.path),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductProccess extends StatelessWidget {
  const ProductProccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.svg.delivered),
              ),
              AppDimens.medium.height,
              const Text(AppStrings.delivered),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.svg.cancelled),
              ),
              AppDimens.medium.height,
              const Text(AppStrings.cancelled),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.svg.inProccess),
              ),
              AppDimens.medium.height,
              const Text(AppStrings.inProccess),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.svgIcon,
    required this.content,
  });
  final String svgIcon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            Expanded(
              child: Text(
                content,
                style: AppTextStyles.title,
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.right,
              ),
            ),
            AppDimens.small.width,
            SvgPicture.asset(
              svgIcon,
            ),
          ],
        ),
      ),
    );
  }
}

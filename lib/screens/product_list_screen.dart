import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CartBadge(
                count: 2,
              ),
              Row(
                children: [
                  const Text("پر فروش ترین ها"),
                  AppDimens.small.width,
                  SvgPicture.asset(Assets.svg.sort),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.svg.close,
                ),
              )
            ],
          ),
        ),
        body: const Column(
          children: [
            TagList(),
            ProductGridView(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.child});

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: preferredSize.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimens.medium),
            bottomRight: Radius.circular(AppDimens.medium),
          ),
          color: AppColors.appbar,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              offset: Offset(0, 2),
              blurRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
          child: child,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, this.count = 0});
  final count;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 32,
          width: 32,
        ),
        SvgPicture.asset(
          Assets.svg.cart,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
        Visibility(
          visible: count > 0 ? true : false,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(3.5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
            margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(AppDimens.large),
            ),
            child: const Text(
              "نیوفورس",
              style: AppTextStyles.tagTitle,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) => const ProductItem(
          productName: "productName",
          productPrice: 100,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/cart_badge.dart';
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/button_style.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/cart_badge.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Row(
            children: [
              const CartBadge(),
              const Expanded(
                child: Text(
                  "product name",
                  style: AppTextStyles.productTitle,
                  textDirection: TextDirection.rtl,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.svg.close,
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    Assets.png.unnamed.path,
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  Container(
                    margin: const EdgeInsets.all(AppDimens.medium),
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppDimens.medium),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.medium),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "بنسر",
                          style: AppTextStyles.productTitle,
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          "مسواک بنسر مدل اکسترا با برس متوسط ۳ عددی",
                          style: AppTextStyles.caption,
                          textDirection: TextDirection.rtl,
                        ),
                        const Divider(),
                        const ProductTabView(),
                        60.0.height,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const ProductSingleBtm(
              productPrice: 63500,
              discount: 20,
              productOldPrice: 122000,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductSingleBtm extends StatelessWidget {
  const ProductSingleBtm({
    super.key,
    this.productPrice = 0,
    this.discount = 0,
    this.productOldPrice = 0,
  });

  final int productPrice;
  final int discount;
  final int productOldPrice;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.small),
        color: AppColors.btmNavColor,
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${productPrice.separateWithComma} تومان",
                      style: AppTextStyles.title,
                    ),
                    Visibility(
                      visible: discount > 0 ? true : false,
                      child: Text(
                        productOldPrice.separateWithComma,
                        style: AppTextStyles.oldPriceStyle,
                      ),
                    ),
                  ],
                ),
                AppDimens.small.width,
                Visibility(
                  visible: discount > 0 ? true : false,
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.small * 0.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.red,
                    ),
                    child: Text(" $discount % "),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: AppButtonStyles.mainButtonStyle,
              onPressed: () {},
              child: const Text(
                AppStrings.addToBasket,
                style: AppTextStyles.mainbuttn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
            itemCount: tabs.length,
            itemExtent: MediaQuery.sizeOf(context).width / 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => setState(() {
                selectedTabIndex = index;
              }),
              child: Container(
                padding: const EdgeInsets.all(AppDimens.medium),
                child: Text(
                  tabs[index],
                  style: selectedTabIndex == index
                      ? AppTextStyles.selectedTab
                      : AppTextStyles.unSelectedTab,
                ),
              ),
            ),
          ),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: const [
            Review(),
            Comments(),
            Features(),
          ],
        ),
      ],
    );
  }
}

List<String> tabs = [
  "نقد و بررسی",
  "نظرات",
  "خصوصیات",
];

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

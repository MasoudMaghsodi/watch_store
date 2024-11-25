import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/shoping_cart_item.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              AppStrings.basket,
              style: AppTextStyles.title,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppDimens.medium),
              padding: const EdgeInsets.all(AppDimens.medium),
              height: size.height * 0.1,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 3.0), //(x,y)
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.svg.leftArrow,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.sendToAddress,
                          style: AppTextStyles.caption,
                        ),
                        const FittedBox(
                          child: Text(
                            AppStrings.lurem,
                            style: AppTextStyles.title,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ShopingCartItem(
                  productTitle: "ساعت شایومی",
                  price: 63500,
                  oldPrice: 112000,
                ),
                itemCount: 10,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

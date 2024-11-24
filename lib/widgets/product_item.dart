import 'package:flutter/material.dart';
import 'package:watch_store/components/extention.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productName,
    required this.productPrice,
    this.productOldPrice = 0,
    this.discount = 0,
    this.time = 0,
  });
  final productName;
  final productPrice;
  final productOldPrice;
  final discount;
  final time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.small),
      margin: const EdgeInsets.all(AppDimens.medium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.medium),
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
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              productName,
              style: AppTextStyles.productTitle,
            ),
          ),
          AppDimens.medium.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productPrice.toString(),
                    style: AppTextStyles.title,
                  ),
                  Visibility(
                    visible: discount > 0 ? true : false,
                    child: Text(
                      productOldPrice.toString(),
                      style: AppTextStyles.oldPriceStyle,
                    ),
                  ),
                ],
              ),
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
          AppDimens.large.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Container(
              height: 2,
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          AppDimens.medium.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Text(
              time.toString(),
              style: AppTextStyles.prodTimerStyle,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../layouts/sizebox_widgets.dart';
import '../layouts/text_widgets.dart';

class ShopByBudgetItem extends StatelessWidget {
  final dynamic text;
  final dynamic badgeText;

  ShopByBudgetItem(this.text, this.badgeText, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Stack(children: [
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LargeText(text, isBold: true, color: Colors.green,),
              SmallText("৳", isBold: true, color: Colors.green,),
            ],
          ),
        ),
        Visibility(
          visible: badgeText != null,
          child: Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppSize.small, vertical: AppSize.xxSmall),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.xxSmall),
                    topRight: Radius.circular(AppSize.xSmall),
                    bottomRight: Radius.circular(AppSize.xSmall),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.green,
                      offset: Offset(-1, 1),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: SmallText(badgeText.toString(), isBold: true, color: Colors.white,),
              ),
            ),
          ),
        ),
      ])
    );
  }
}

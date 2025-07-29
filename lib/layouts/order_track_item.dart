import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../layouts/sizebox_widgets.dart';
import '../layouts/text_widgets.dart';

class OrderTrackItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isComplete;
  OrderTrackItem({Key? key, required this.title, required this.subTitle, required this.isComplete});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(children: [
            Icon(Icons.check_circle, color: Theme.of(context).primaryColor),
            Expanded(
              child: VerticalDivider(
                thickness: 1,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ]),
        ),

        Expanded(child: Padding(
          padding: EdgeInsets.fromLTRB(AppSize.xxSmall, AppSize.xxSmall, AppSize.xxSmall, AppSize.small),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText(title, isBold: true,),
              SmallSpacer(),
              SmallText(subTitle, color: Colors.grey,),
            ],
          ),
        )),
      ],),
    );
  }
}

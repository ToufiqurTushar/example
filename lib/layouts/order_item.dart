import 'package:flutter/material.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../layouts/text_widgets.dart';

class OrderItem extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final String subTitle;
  OrderItem({Key? key, required this.id, required this.image, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(6), right: Radius.zero),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/placeholder.png',
                    image: image,
                    fit: BoxFit.cover,
                  )
              )
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 12,right: 12,bottom: 14),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //color:Colors.blue,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SmallText(subTitle, isBold: true,),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

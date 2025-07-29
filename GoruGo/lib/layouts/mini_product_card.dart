import 'package:flutter/material.dart';
class MiniProductCard extends StatefulWidget {
  final int id;
  final String image;
  final String name;
  final String main_price;
  final String stroked_price;
  final String discount;
  final bool has_discount;

  MiniProductCard({Key? key, required this.id, required this.image, required this.name, required this.main_price,required this.stroked_price, required this.has_discount, required this.discount})
      : super(key: key);

  @override
  _MiniProductCardState createState() => _MiniProductCardState();
}

class _MiniProductCardState extends State<MiniProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Card(
        child: Container(
          width: 135,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(6), bottom: Radius.zero),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/placeholder.png',
                            image:  widget.image,
                            fit: BoxFit.cover,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 6),
                  child: Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        height: 1.2,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                widget.has_discount ? Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    widget.stroked_price,
                    maxLines: 1,
                    style: const TextStyle(
                        decoration:TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                ):Container(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    widget.main_price,
                    maxLines: 1,
                    style: const TextStyle(
                        color:Colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),

              ]),
        ),
      ),
    );
  }
}

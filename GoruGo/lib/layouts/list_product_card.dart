import 'package:flutter/material.dart';


class ListProductCard extends StatefulWidget {
  final int id;
  final String image;
  final String name;
  final String main_price;
  final String stroked_price;
  final bool has_discount;

  ListProductCard(
      {Key? key,
      required this.id,
      required this.image,
      required this.name,
      required this.main_price,
      required this.stroked_price,
      required this.has_discount})
      : super(key: key);

  @override
  _ListProductCardState createState() => _ListProductCardState();
}

class _ListProductCardState extends State<ListProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       
      },
      child: Card(
        child: Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Container(
                width: 100,
                height: 100,
                child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(6), right: Radius.zero),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/placeholder.png',
                      image: widget.image,
                      fit: BoxFit.cover,
                    ))),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 12,right: 12,bottom: 14),
              //width: 240,
              height: 100,
             //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //color:Colors.blue,
                    child: Text(
                      widget.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,

                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          height: 1.6,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    //color:Colors.green,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.main_price,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: const TextStyle(

                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        widget.has_discount
                            ? Text(
                              widget.stroked_price,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                            : Container(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

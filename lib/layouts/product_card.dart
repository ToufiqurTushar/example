import 'package:flutter_rapid/flutter_rapid.dart';
import '../config/app_theme.dart';
import '../page/home/home_view.dart';
class ProductCard extends StatefulWidget {
  final int id;
  final String image;
  final String name;
  final String main_price;
  final String stroked_price;
  final bool has_discount;
  final String discount;

  ProductCard({Key? key, required this.id, required this.image, required this.name, required this.main_price,required this.stroked_price, required this.has_discount, required this.discount}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  var cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(HomeView.routeName);
      },
      child: Card(
        child: Container(
          child: Stack(
            children: [
              Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                          width: double.infinity,
                          //height: 158,
                          child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(AppSize.normal), bottom: Radius.zero),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/placeholder.png',
                                image:  widget.image,
                                fit: BoxFit.cover,
                              )
                          )
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSize.xxSmall),
                            child: Text(
                              widget.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.2,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppSize.xxSmall),
                              child: Text(
                                widget.main_price,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppSize.xxSmall),
                              child: Text(
                                widget.stroked_price,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    decoration:TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSize.xxSmall),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: cartCount > 0,
                                  child: Card(
                                    margin: EdgeInsets.only(top: AppSize.xSmall),
                                    child: Row(children: [
                                      InkWell(
                                        onTap:() {
                                          cartCount--;
                                          setState(() {});
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: AppSize.normal, vertical: AppSize.xSmall),
                                            color: Colors.grey,
                                            child: Text('-', style: TextStyle(fontSize: AppSize.normal, color: Colors.white))
                                        ),
                                      ),
                                      Expanded (
                                          flex: 1,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: AppSize.small, vertical: AppSize.xSmall),
                                            color: Colors.green,
                                              child: Text(cartCount.toString(), style: TextStyle(fontSize: AppSize.normal, color: Colors.white), textAlign: TextAlign.center,)
                                          )
                                      ),
                                      InkWell(
                                        onTap:() {
                                          cartCount++;
                                          setState(() {});
                                        },
                                        child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: AppSize.normal, vertical: AppSize.xSmall),
                                            color: Colors.grey,
                                            child: Text('+', style: TextStyle(fontSize: AppSize.normal, color: Colors.white))
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(30), // NEW
                                  ),
                                  onPressed: () {
                                    cartCount++;
                                    setState(() {});
                                  },
                                  child: Text('Buy Now', style: TextStyle(fontSize: AppSize.normal),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),

              Visibility(
                visible: widget.has_discount,
                child: Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                      decoration: const BoxDecoration(
                        color: Color(0xffe62e04),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6.0),
                          bottomLeft: Radius.circular(6.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(-1, 1),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Text(
                        widget.discount??"",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          height: 1.8,
                        ),
                        textHeightBehavior:
                        const TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

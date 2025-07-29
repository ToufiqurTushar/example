import 'package:flutter/material.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../config/app_theme.dart';
import 'round_icon_button.dart';
import 'sizebox_widgets.dart';
import 'text_widgets.dart';

class CartItem extends StatefulWidget {
  final int id;
  final String image;
  final String title;
  final String subTitle;
  final int? cartTotalItem;
  final VoidCallback onPressedPlus;
  final VoidCallback onPressedMinus;
  final VoidCallback onPressedDelete;


  CartItem({Key? key, required this.id, required this.image, required this.title, required this.subTitle, required this.cartTotalItem, required this.onPressedPlus, required this.onPressedMinus, required this.onPressedDelete}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  var cartCount = 0;

  @override
  void initState() {
    super.initState();
    cartCount = widget.cartTotalItem??0;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(6), right: Radius.zero),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/placeholder.png',
                    image: widget.image,
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
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          height: 1.6,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SmallText(widget.subTitle, isBold: true,),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){
              widget.onPressedDelete();
            },
            child: Padding(
              padding: EdgeInsets.all(AppSize.xSmall),
              child: Icon(Icons.delete, color: Colors.red,),
            ),
          ),


          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSize.xxSmall),
            child: Column(
              children: [
                RoundIconButton(color: Theme.of(context).scaffoldBackgroundColor, icon:Icons.remove, radius: 26, iconSize: 26.0, iconColor:Theme.of(context).primaryColor,  onPressed: (){
                  if(cartCount > 1) {
                    cartCount--;
                    widget.onPressedMinus();
                    setState(() {});
                  }

                }),
                XXSmallSpacer(),
                NormalText(cartCount),
                XXSmallSpacer(),
                RoundIconButton(color: Theme.of(context).scaffoldBackgroundColor, icon:Icons.add, radius: 26, iconSize: 26, iconColor:Theme.of(context).primaryColor, onPressed: (){
                  cartCount++;
                  widget.onPressedPlus();
                  setState(() {});
                })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

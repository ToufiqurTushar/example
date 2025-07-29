import 'package:flutter/material.dart';
import '../config/app_theme.dart';

class RoundIconButton extends StatelessWidget {
  final dynamic text;
  final Color? textColor;
  final Color? color;
  final Color? iconColor;
  final double? fontSize;
  final bool? isBold;
  final double radius;
  final double iconSize;
  final IconData icon;
  final VoidCallback? onPressed;
  RoundIconButton({Key? key, this.text, this.textColor, this.isBold, required this.icon, this.fontSize, this.iconColor, this.onPressed, this.color, required this.radius, required this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Material(
            color: color,
            child: InkWell(
              splashColor: Colors.red, // Splash color
              onTap: onPressed,
              child: SizedBox(width: radius, height: radius, child: Icon(icon, color: iconColor, size: iconSize,)),
            ),
          ),
        ),
        if(text!=null)Text(text.toString(), style: TextStyle(fontSize: fontSize??AppSize.normal, color: textColor, fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal),)
      ],
    );
  }
}

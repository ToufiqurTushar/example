import 'package:flutter/material.dart';
import 'package:flutter_rapid/flutter_rapid.dart';

import '../config/app_theme.dart';

class SmallText extends StatelessWidget {
  final dynamic text;
  final Color? color;
  final bool? isBold;
  final bool? isCenter;
  SmallText(this.text, {Key? key, this.color, this.isBold, this.isCenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(), textAlign: isCenter == true ? TextAlign.center: TextAlign.left,  style: TextStyle(fontSize: AppSize.small, color: color??Theme.of(Get.context!).focusColor, fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal),);
  }
}
class NormalText extends StatelessWidget {
  final dynamic text;
  final Color? color;
  final bool? isBold;
  final bool? isCenter;
  final bool? isItalic;
  NormalText(this.text, {Key? key, this.color, this.isBold, this.isCenter, this.isItalic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(), textAlign: isCenter == true ? TextAlign.center: TextAlign.left, style: TextStyle(fontSize: AppSize.normal, color: color??Theme.of(Get.context!).focusColor, fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal, fontStyle: isItalic == true ? FontStyle.italic: FontStyle.normal),);
  }
}
class MediumText extends StatelessWidget {
  final dynamic text;
  final Color? color;
  final bool? isBold;
  final bool? isCenter;
  MediumText(this.text, {Key? key, this.color, this.isBold, this.isCenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(), textAlign: isCenter == true ? TextAlign.center: TextAlign.left, style: TextStyle(fontSize: AppSize.medium, color: color??Theme.of(Get.context!).focusColor, fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal),);
  }
}

class LargeText extends StatelessWidget {
  final dynamic text;
  final Color? color;
  final bool? isBold;
  final bool? isCenter;
  LargeText(this.text, {Key? key, this.color, this.isBold, this.isCenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(), textAlign: isCenter == true ? TextAlign.center: TextAlign.left, style: TextStyle(fontSize: AppSize.large, color: color??Theme.of(Get.context!).focusColor, fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal),);
  }
}

class XLargeText extends StatelessWidget {
  final dynamic text;
  final Color? color;
  final bool? isBold;
  final bool? isCenter;
  XLargeText(this.text, {Key? key, this.color, this.isBold, this.isCenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(), textAlign: isCenter == true ? TextAlign.center: TextAlign.left, style: TextStyle(fontSize: AppSize.xLarge, color: color??Theme.of(Get.context!).focusColor, fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal),);
  }
}

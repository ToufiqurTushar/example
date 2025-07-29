import 'package:cowmaster/layouts/sizebox_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid/flutter_rapid.dart';

class HeaderWidget extends StatelessWidget {
  final Function? onTap;
  final IconData? icon;
  final String? title;
  final Color? headerBackgroundColor;
  final Color? backgroundColor;
  final Color? headerTextcolor;
  final bool? isCentered;
  final Widget child;
  final EdgeInsets? headerMargin;
  final double? elevation;
  final EdgeInsets? contentMargin;
  HeaderWidget({
    super.key,
    this.onTap,
    this.icon,
    required this.child,
    this.backgroundColor,
    this.headerBackgroundColor,
    this.isCentered,
    this.headerTextcolor,
    this.title,
    this.headerMargin,
    this.elevation,
    this.contentMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation??0,
      color: backgroundColor??Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: headerMargin??EdgeInsets.all(4),
                child: title==null?Container():Container(
                  decoration: BoxDecoration(
                    color: headerBackgroundColor??Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(title!, style: TextStyle(fontSize: 16, color: headerTextcolor??Colors.white, fontWeight: FontWeight.bold), textAlign: (isCentered??false)? TextAlign.center: TextAlign.left,),
                  ),
                ),
              ),
              if(icon != null)
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    onTap?.call();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 4),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2,),
                        ),
                        padding: EdgeInsets.all(2),
                        child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF6E9B8F), Color(0xFF98C9B8)],
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(icon, color: Colors.white, size: 24),
                            )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: contentMargin??EdgeInsets.zero,
              child: child
          ),
          XXXSmallSpacer(),
        ],
      ),
    );
  }
}

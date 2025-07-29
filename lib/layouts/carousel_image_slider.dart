import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel_form_validation/rules/in.dart';
import '../config/app_theme.dart';

class CarouselImageSlider extends StatefulWidget {
  final List<dynamic> imageList;
  final Function(int index, CarouselPageChangedReason reason) onPageChanged;

  EdgeInsetsGeometry? padding;
  double? aspectRatio;
  double? radius;
  final Function(int index, String imagePath) onItemClick;
  CarouselImageSlider({Key? key, required this.imageList, required this.onPageChanged, this.padding, this.aspectRatio, this.radius, required this.onItemClick}) {
    padding ??= EdgeInsets.zero;
    aspectRatio ??= 16/9;
    radius ??= AppSize.normal;
  }

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              aspectRatio: widget.aspectRatio!,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.easeInExpo,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                currentIndex = index;
                widget.onPageChanged(index, reason);
                setState(() {});
              },
          ),
          items: widget.imageList.asMap().entries.map((item) {
            return Padding(
              padding: widget.padding!,
              child: InkWell(
                onTap: () {
                  widget.onItemClick(item.key, item.value);
                },
                child: Container(
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(widget.radius!)),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/placeholder_rectangle.png',
                          image: item.value,
                          fit: BoxFit.cover,
                        )
                    )
                ),
              ),
            );
          }).toList(),
        ),
        Positioned.fill(
          bottom: 20,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.imageList.length, (index) {
                    return Container(
                        width: AppSize.xSmall,
                        height: AppSize.xSmall,
                        margin: EdgeInsets.symmetric(horizontal: AppSize.xxSmall),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  currentIndex == index ? Theme.of(context).primaryColor : Colors.white.withOpacity(0.2),
                        )
                    );
                  }
                )
              )
          ),
        ),
      ],
    );
  }
}

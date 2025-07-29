import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../common/app_extenstion.dart';
import '../config/app_theme.dart';

class GalleryView extends ModalRoute<void> {
  final List<dynamic> imageList;
  int currentIndex;
  GalleryView({Key? key,required this.imageList, required this.currentIndex, });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.8);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: GaleryContent(imageList: imageList, currentIndex: currentIndex,),
      ),
    );
  }
}

class GaleryContent extends StatefulWidget {
  final List<dynamic> imageList;
  int currentIndex;
  GaleryContent({Key? key, required this.imageList, required this.currentIndex});

  @override
  State<GaleryContent> createState() => _GaleryContentState();
}

class _GaleryContentState extends State<GaleryContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoView(
          backgroundDecoration: BoxDecoration(
              color:Colors.black.withOpacity(0)
          ),
          enableRotation: false,
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 3.5,
          initialScale: PhotoViewComputedScale.contained,
          basePosition: Alignment.center,
          imageProvider: NetworkImage(widget.imageList[widget.currentIndex]),
        ),
        Positioned(top: 0, right: 0, child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, color: Colors.white,),
            ),
          ],
        )),
        Positioned(bottom: 10, right: 0, child: Row(
          children: [
            Container(
              height: 80,
              width: context.appWidth,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        widget.currentIndex = index;
                        setState(() {});
                      },
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Theme.of(context).primaryColor, width: widget.currentIndex == index? 2 : 0),
                          ),
                          child: Row(
                              children:[
                                FadeInImage.assetNetwork(
                                  placeholder: 'assets/placeholder.png',
                                  image: widget.imageList[index],
                                  fit: BoxFit.cover,
                                ),
                              ]
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ))

      ],
    );
  }
}

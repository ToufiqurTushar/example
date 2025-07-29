import 'package:cowmaster/page/bottom_nav/bottom_nav_logic.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../../config/app_config.dart';

class HomeLogic extends RapidStartLogic {
  AppBaseConfig config = Get.find();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var name = "".obs;
  final List<Map<String, dynamic>> cattleInfo = [
    {"label": "Cows", "count": "20", "color": Color(0xffffbc6f), "icon": Icons.pets},
    {"label": "Heifers", "count": "09", "color": Color(0xfffa5869), "icon": Icons.pets},
    {"label": "Bulls", "count": "02", "color": Color(0xfffb93b9), "icon": Icons.pets},
    {"label": "Weaners", "count": "06", "color": Color(0xff85cebf), "icon": Icons.pets},
    {"label": "Calves", "count": "05", "color": Color(0xff00a8da), "icon": Icons.pets},
  ];
  final List<Map<String, dynamic>> summeryInfo = [
    {"label": "Sick", "count": "20", "color": Color(0xffffbc6f), "icon": Icons.pets},
    {"label": "Milking", "count": "02", "color": Color(0xfff893b6), "icon": Icons.pets},
    {"label": "Pregnant", "count": "09", "color": Color(0xfffa5869), "icon": Icons.pets},
    {"label": "Dry", "count": "06", "color": Color(0xff87cebf), "icon": Icons.pets},
  ];

  @override
  void onInit() {
    super.onInit();

  }
}
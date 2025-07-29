import 'package:flutter_rapid/flutter_rapid.dart';
import '../cattle_list/cattle_list_view.dart';
import '../home/home_view.dart';
import '../notification_list/notifiction_list_view.dart';
import '../report_list/report_list_view.dart';
import 'bottom_nav_i18n.dart';
import 'bottom_nav_logic.dart';


class BottomNavView extends RapidView<BottomNavLogic> {
  static String routeName = "/bottom-nav";

  const BottomNavView({super.key});

  List<BottomNavItem> getNavItems() {
    List<BottomNavItem> items = [
      BottomNavItem(
        routeName: HomeView.routeName,
        icon: const Icon(Icons.home, color: Colors.white,),
        activeIcon: Icon(Icons.home, color: Theme.of(Get.context!).primaryColor,),
        label: 'Summery',
        backgroundColor: const Color(0xFFFFFFFF),
        enableBackInNav:true,
      ),
      BottomNavItem(
        routeName: CattleListView.routeName,
        icon: const Icon(Icons.pets, color: Colors.white,),
        activeIcon: Icon(Icons.pets, color: Theme.of(Get.context!).primaryColor,),
        label: 'Cattle',
        enableBackInNav:true,
      ),
      BottomNavItem(
        routeName: NotifictionListView.routeName,
        icon: const Icon(Icons.notifications, color: Colors.white,),
        activeIcon: Icon(Icons.notifications, color:  Theme.of(Get.context!).primaryColor,),
        label: 'Notification',
        enableBackInNav:true,
      ),
      BottomNavItem(
        routeName: ReportListView.routeName,
        icon: const Icon(Icons.assignment, color: Colors.white,),
        activeIcon: Icon(Icons.assignment, color:  Theme.of(Get.context!).primaryColor,),
        label: 'Reports',
        enableBackInNav:true,
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope( // Added WillPopScope
      onWillPop: () async {
        if (controller.isDrawerOpen) {
          controller.isDrawerOpen = false;
          controller.scaffoldKey.currentState!.closeDrawer();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: RapidNavigatorManager(
          routeKey: Get.nestedKey(1),
          initialRoute: HomeView.routeName,
        ),
        bottomNavigationBar: BottomNavManager(
          navType: BottomNavType.convex,
          items: getNavItems(),
          parentRouteKey: 1,
          backgroundColor: Theme.of(context).primaryColor,
        ),

      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<BottomNavLogic>(() => BottomNavLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return BottomNavI18N.getTranslations();
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cowmaster/page/report_list/report_list_i18n.dart';
import 'package:cowmaster/page/report_list/report_list_logic.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../../layouts/custom_drawer.dart';
import '../../layouts/sizebox_widgets.dart';
import '../bottom_nav/bottom_nav_logic.dart';



class ReportListView extends RapidView<ReportListLogic> {
  static String routeName = "/ReportListView";

  const ReportListView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.scaffoldKey = GlobalKey<ScaffoldState>();
    return Obx(
      ()=> Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Report'),
        ),
        drawer: const AppDrawer(),
        onDrawerChanged: (bool isOpened){
          Get.find<BottomNavLogic>().isDrawerOpen = isOpened;
          Get.find<BottomNavLogic>().scaffoldKey = controller.scaffoldKey;
        },
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          child: Column(
            children: [
              if(controller.reportData.isEmpty)
              NoReportWidget(),
              Expanded(
                child: ListView.separated( // Changed to ListView.separated
                  // padding: const EdgeInsets.all(16.0),
                  itemCount: controller.reportData.length, // Number of items in the list
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16.0); // Separator between items
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final report = controller.reportData[index]; // Get current notifiction data
                    return Card(
                      color: Colors.white ,
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Icon(Icons.featured_play_list_outlined),
                        title: Text(report['statusText']),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    )
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<ReportListLogic>(() => ReportListLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return ReportList18N.getTranslations();
  }



  Widget NoReportWidget() {
    if(controller.isLoading.value)
    return SizedBox.shrink();
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.manage_search, // A magnifying glass with lines, similar to the image
                size: 100,
                color: Colors.grey[500],
              ),
              const SizedBox(height: 24),
              Text(
                "You haven't created any reports in the last 60 days. You can create reports from the top-right menu of each management module.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5, // Line height for better readability
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


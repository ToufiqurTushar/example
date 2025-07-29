
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_laravel_form_validation/extensions/extensions.dart';
import 'package:flutter_laravel_form_validation/laravel_validation_rules.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import 'package:intl/intl.dart';
import '../../layouts/custom_drawer.dart';
import '../../layouts/text_widgets.dart';
import '../../layouts/sizebox_widgets.dart';
import '../bottom_nav/bottom_nav_logic.dart';
import 'notifiction_list_i18n.dart';
import 'notifiction_list_logic.dart';


class NotifictionListView extends RapidView<NotifictionListLogic> {
  static String routeName = "/NotifictionListView";

  const NotifictionListView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.scaffoldKey = GlobalKey<ScaffoldState>();
    return Obx(
      ()=> Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Notifiction'),
        ),
        drawer: const AppDrawer(),
        onDrawerChanged: (bool isOpened){
          Get.find<BottomNavLogic>().isDrawerOpen = isOpened;
          Get.find<BottomNavLogic>().scaffoldKey = controller.scaffoldKey;
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              // Date Range Selector
              XSmallSpacer(),
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, size: 18),
                      onPressed: () {
                        // Handle previous date range
                      },
                    ),
                    const Text(
                      'Jul 01, 2025 - Jul 31, 2025',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 18),
                      onPressed: () {
                        // Handle next date range
                      },
                    ),
                  ],
                ),
              ),
              XSmallSpacer(),
              Row(
                children: [
                  Expanded(
                    child: ToggleButtons(
                      isSelected: [
                        controller.selectedFilter.value == 'Today',
                        controller.selectedFilter.value == 'Tasks',
                        controller.selectedFilter.value == 'Grouped',
                      ],
                      onPressed: (int index) {
                          if (index == 0) {
                            controller.selectedFilter.value = 'Today';
                          } else if (index == 1) {
                            controller.selectedFilter.value = 'Tasks';
                          } else if (index == 2) {
                            controller.selectedFilter.value = 'Grouped';
                          }
                      },
                      borderRadius: BorderRadius.circular(8),
                      selectedColor: Colors.white,
                      fillColor: Colors.teal, // Selected button background
                      color: Colors.black54, // Unselected button text color
                      borderColor: Colors.grey[400],
                      selectedBorderColor: Colors.teal,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('Today'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('Tasks'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('Grouped'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Checkbox(
                        value: controller.showCompleted.value,
                        onChanged: (bool? value) {
                          controller.showCompleted.value = value!;
                        },
                      ),
                      const Text('Completed'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Notification/Task List
              Expanded(
                //       child: ListView.separated( // Changed to ListView.separated
                //         // padding: const EdgeInsets.all(16.0),
                //         itemCount: controller.notifictionData.length, // Number of items in the list
                //         separatorBuilder: (BuildContext context, int index) {
                //           return const SizedBox(height: 16.0); // Separator between items
                //         },
                //         itemBuilder: (BuildContext context, int index) {
                //           final notifiction = controller.notifictionData[index]; // Get current notifiction data
                //           return NotificationTaskCard(
      //                       icon: Icons.calendar_today, // Calendar icon
      //                       title: 'hello notify',
      //                       subtitle: 'this is note',
      //                       dateNumber: '29',
      //                       dateMonth: 'Jul 25',
      //                       dateColor: Colors.orange,
      //                       isNotification: true, // Specific styling for notification
      //                     );
                //         },
                //       ),
                child: ListView(
                  children: [
                    NotificationTaskCard(
                      icon: Icons.calendar_today, // Calendar icon
                      title: 'hello notify',
                      subtitle: 'this is note',
                      dateNumber: '29',
                      dateMonth: 'Jul 25',
                      dateColor: Colors.orange,
                      isNotification: true, // Specific styling for notification
                    ),
                    const SizedBox(height: 16),
                    NotificationTaskCard(
                      icon: Icons.pets, // Cow icon
                      title: 'Weaning Time',
                      subtitle: "It's time for the planned weaning.",
                      cattleId: 'bramha1',
                      dateNumber: '24-27',
                      dateMonth: 'Sep 25',
                      dateColor: Colors.teal,
                      isNotification: false, // Specific styling for task
                    ),
                    const SizedBox(height: 16),
                    // Add more cards as needed
                  ],
                ),
              ),
            ],
          ),

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddNotifictionBottomSheet(context);
          },
          backgroundColor: Colors.green, // Color matching the image
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Rounded corners for FAB
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<NotifictionListLogic>(() => NotifictionListLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return NotifictionList18N.getTranslations();
  }

  void _showAddNotifictionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.94,
          minChildSize: 0.3,
          maxChildSize: 0.94,
          snap: true,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            // Your UI from the previous response goes here
            return Column(
              children: [
                // Top Bar (Close, Add Notifiction, Save)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        child: const Text('Close', style: TextStyle(color: Colors.red)),
                      ),
                      const Text('Add Notifiction', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      GestureDetector(
                        onTap: () {
                          // Handle save logic here
                          Navigator.pop(context); // Close after saving
                        },
                        child: const Text('Save', style: TextStyle(color: Colors.green)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController, // Pass the scroll controller
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name Input
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Ear Tag Input
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Ear Tag',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    // Helper function to build a sorting menu item
    PopupMenuItem<String> _buildSortingMenuItem({
      required String label,
      required String valueAsc,
      required String valueDesc,
      required bool initialAscending,
      bool highlight = false, // To highlight 'Entry Date'
    }) {
      // Determine the icon based on initial sorting direction
      IconData icon = initialAscending ? Icons.arrow_drop_up : Icons.arrow_drop_down;
      String selectedValue = initialAscending ? valueAsc : valueDesc;

      // Determine text and icon color based on highlight
      Color textColor = highlight ? Colors.green : Colors.white;
      Color iconColor = highlight ? Colors.green : Colors.white;

      return PopupMenuItem<String>(
        value: selectedValue, // Return the value for the selected sort
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(color: textColor), // Dynamic text color
            ),
            Icon(icon, color: iconColor), // Dynamic icon color
          ],
        ),
      );
    }
  }

  Widget NotificationTaskCard({
    required IconData icon,
    required String title,
    required String subtitle,
    String? cattleId, // Optional for tasks
    required String dateNumber,
    required String dateMonth,
    required Color dateColor,
    required bool isNotification, // True for notification, false for task
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white, // Background color based on type
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Icon/Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isNotification ? Colors.grey[200] : Colors.grey[400], // Background color for icon container
                borderRadius: BorderRadius.circular(8),
              ),
              child: isNotification
                  ? Icon(icon, size: 30, color: Colors.grey[700])
                  : Image.asset('assets/ic_cattle.png', width: 20, color: Colors.white,), // Cow icon for task
            ),
            const SizedBox(width: 12),
            // Title, Subtitle, Cattle ID
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isNotification ? Colors.black87 : Colors.black87,
                    ),
                  ),
                  if (cattleId != null)
                    Text(
                      cattleId,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Date Box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: dateColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dateNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    dateMonth,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


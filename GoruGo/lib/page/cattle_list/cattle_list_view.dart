
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cowmaster/page/cattle_details/cattle_details_view.dart';
import 'package:flutter_laravel_form_validation/extensions/extensions.dart';
import 'package:flutter_laravel_form_validation/laravel_validation_rules.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import 'package:intl/intl.dart';
import '../../layouts/custom_drawer.dart';
import '../../layouts/text_widgets.dart';
import '../../layouts/sizebox_widgets.dart';
import '../bottom_nav/bottom_nav_logic.dart';
import 'cattle_list_i18n.dart';
import 'cattle_list_logic.dart';


class CattleListView extends RapidView<CattleListLogic> {
  static String routeName = "/CattleListView";

  const CattleListView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.scaffoldKey = GlobalKey<ScaffoldState>();
    return Obx(
      ()=> Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Cattle'),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.filter_list, color: Colors.white), // Filter/List icon
              onSelected: (String result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: $result')),
                );
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                _buildSortingMenuItem(
                  label: 'EarTag',
                  valueAsc: 'EarTag_Asc',
                  valueDesc: 'EarTag_Desc',
                  initialAscending: true, // Example: EarTag starts ascending
                ),
                _buildSortingMenuItem(
                  label: 'Name',
                  valueAsc: 'Name_Asc',
                  valueDesc: 'Name_Desc',
                  initialAscending: false, // Example: Name starts descending
                ),
                _buildSortingMenuItem(
                  label: 'Birth Date',
                  valueAsc: 'BirthDate_Asc',
                  valueDesc: 'BirthDate_Desc',
                  initialAscending: true,
                ),
                _buildSortingMenuItem(
                  label: 'Entry Date',
                  valueAsc: 'EntryDate_Asc',
                  valueDesc: 'EntryDate_Desc',
                  initialAscending: true, // Example: Entry Date starts ascending and is highlighted
                  highlight: true,
                ),
                _buildSortingMenuItem(
                  label: 'Calving',
                  valueAsc: 'Calving_Asc',
                  valueDesc: 'Calving_Desc',
                  initialAscending: true,
                ),
                _buildSortingMenuItem(
                  label: 'Priority',
                  valueAsc: 'Priority_Asc',
                  valueDesc: 'Priority_Desc',
                  initialAscending: true,
                ),
              ],
              color: const Color(0xFF333333), // Dark background for the popup menu
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners for the popup menu
              ),
              elevation: 8, // Shadow for the popup menu
              //offset: const Offset(0, 56), // Adjust offset to align with app bar icon
            ),

            IconButton(
              icon: Icon(controller.hideSearchBar.value? Icons.search: Icons.close, color: Colors.white), // Search icon
              onPressed: () {
                controller.hideSearchBar.value = !controller.hideSearchBar.value;
              },
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.white), // More options icon
              onSelected: (String result) {
                // Handle menu item selection
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: $result')),
                );
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                _buildPopupMenuItem(
                  value: 'Add Cattle from Excel',
                  icon: Icons.folder_open, // Changed to folder_open for Excel-like icon
                  label: 'Add Cattle from Excel',
                ),
                _buildPopupMenuItem(
                  value: 'Add Bulk Events',
                  icon: Icons.calendar_today,
                  label: 'Add Bulk Events',
                ),
                _buildPopupMenuItem(
                  value: 'Cattle List Report',
                  icon: Icons.assignment,
                  label: 'Cattle List Report',
                ),
                _buildPopupMenuItem(
                  value: 'Delete',
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
              color: Colors.white, // Background color of the popup menu
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners for the popup menu
              ),
              elevation: 8, // Shadow for the popup menu
            ),
          ],
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
              Visibility(
                visible: controller.hideSearchBar.isFalse,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hint: Text('Search'),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated( // Changed to ListView.separated
                  // padding: const EdgeInsets.all(16.0),
                  itemCount: controller.cattleData.length, // Number of items in the list
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16.0); // Separator between items
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final cattle = controller.cattleData[index]; // Get current cattle data
                    return CattleListItem( // No Padding needed here anymore
                      imageUrl: cattle['imageUrl'],
                      cattleId: cattle['cattleId'],
                      statusText: cattle['statusText'],
                      statusColor: cattle['statusColor'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddCattleBottomSheet(context);
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
  // Helper function to build PopupMenuItem with icon and text
  PopupMenuItem<String> _buildPopupMenuItem({
    required String value,
    required IconData icon,
    required String label,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: Colors.black54), // Icon color
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Colors.black87)), // Text color
        ],
      ),
    );
  }

  Widget CattleListItem({
    required String imageUrl,
    required String cattleId,
    required String statusText,
    required Color statusColor,
  }) {
    return InkWell(
      onTap: (){
        Get.toNamed(CattleDetailsView.routeName);
      },
      child: Card(
        color: Colors.white ,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cattle Image
              Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Cattle Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.pets, size: 18, color: Colors.grey),
                    Row(
                      children: [
                        const Icon(Icons.pets, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          cattleId,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              // Right-side icons
              Column(
                children: [
                  const Icon(Icons.notifications_none, size: 20, color: Colors.grey),
                  const SizedBox(height: 4),
                  Icon(Icons.edit_note, size: 20, color: Colors.grey[700]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddCattleForm(BuildContext context) {
    return Obx(
      ()=> Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            autovalidateMode: controller.formValidateMode.value,
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  controller: controller.formController['name'],
                  validator: [
                    FLValidator.required
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ear Tag',
                  ),
                  controller: controller.formController['name'],
                  validator: [
                    FLValidator.required
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mobile',
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  controller: controller.formController['dateOfBirth'],
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today),
                      labelText: "Date of Birth",
                      hintText: 'Select Date'
                  ),
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                  readOnly: true,
                  onTap: () async {
                    print("Date is not selected");
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now()
                    );

                    if(pickedDate != null ){
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      controller.formController['dateOfBirth']!.text = formattedDate;
                    } else{
                      print("Date is not selected");
                    }
                  },
                ),
                XXSmallSpacer(),
                SmallText('Gender'),
                Stack(
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: controller.formController['gender'],
                      validator: [
                        FLValidator.required,
                        FLValidator.interger
                      ].validate(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: const Text("Male"),
                            value: 'male',
                            groupValue: controller.gender.value,
                            onChanged: (value){
                              controller.formController['gender']!.text = value.toString();
                              controller.gender.value = value!;
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: const Text("Female"),
                            value: 'female',
                            groupValue: controller.gender.value,
                            onChanged: (value){
                              controller.formController['gender']!.text = value.toString();
                              controller.gender.value = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Breed',
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Dam Ear Tag',
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Sire, Name, Tag',
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),

                SizedBox(
                  width:double.infinity,
                  child: FrElevatedButton(
                      name: "Add Cattle",
                      onPressed: controller.formSubmit
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  @override
  void loadDependentLogics() {
    Get.lazyPut<CattleListLogic>(() => CattleListLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return CattleList18N.getTranslations();
  }

  void _showAddCattleBottomSheet(BuildContext context) {
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
                // Top Bar (Close, Add Cattle, Save)
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
                      const Text('Add Cattle', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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

                          // Gender Selection (Female/Male) - simplified for example
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[300],
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: const Text('Female', style: TextStyle(color: Colors.black)),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: const Text('Male', style: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Birth Date Input
                          TextFormField(
                            controller: controller.formController['dateOfBirth'],
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today),
                                labelText: "Date of Birth",
                                hintText: 'Select Date'
                            ),
                            validator: [
                              FLValidator.required,
                              FLValidator.interger
                            ].validate(),
                            readOnly: true,
                            onTap: () async {
                              print("Date is not selected");
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime.now()
                              );
                              if(pickedDate != null ){
                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                controller.formController['dateOfBirth']!.text = formattedDate;
                              } else{
                                print("Date is not selected");
                              }
                            },
                          ),
                          const SizedBox(height: 16),

                          // Breed Input
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Breed',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Dam Ear Tag Input
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Dam Ear Tag',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Sire Name, Tag Input
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Sire Name, Tag',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Notes Input
                          const TextField(
                            decoration: InputDecoration(
                              labelText: 'Notes',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 3,
                          ),
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
}


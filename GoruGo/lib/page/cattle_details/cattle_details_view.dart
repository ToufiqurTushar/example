import 'package:flutter_rapid/flutter_rapid.dart';
import '../../layouts/collapsable_card.dart';
import 'cattle_details_i18n.dart';
import 'cattle_details_logic.dart';


class CattleDetailsView extends RapidView<CattleDetailsLogic> {
  static String routeName = "/CattleDetailsView";

  const CattleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cattle Name'),
        actions: [
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
                value: 'Edit',
                icon: Icons.edit, // Changed to folder_open for Excel-like icon
                label: 'Edit',
              ),
              _buildPopupMenuItem(
                value: 'Add Event',
                icon: Icons.calendar_today,
                label: 'Add Event',
              ),
              _buildPopupMenuItem(
                value: 'Dispose From Dairy',
                icon: Icons.login,
                label: 'Dispose From Dairy',
              ),
              _buildPopupMenuItem(
                value: 'Delete',
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 8, // Shadow for the popup menu
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image and Add Photo Section
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage('https://placehold.co/600x400/E0E0E0/FFFFFF?text=Cattle+Image'), // Placeholder image
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: const Icon(Icons.star, color: Colors.white, size: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[400]!),
                      //borderStyle: BorderStyle.dashed,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo, color: Colors.grey),
                        SizedBox(height: 4),
                        Text('Add Photo', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Cattle State Card
            CollapsibleCard(
              title: 'Cattle State',
              icon: Icons.arrow_upward,
              showAddButton: true,
              children: [
                StateRow(
                  icon: Icons.pregnant_woman,
                  title: 'Pregnancy Information',
                  subtitle: 'Pregnant since Sep 20, 2024\nGestational period: 176 days\nCalving due date: Oct 18, 2025\n(92 day(s) later)',
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                StateRow(
                  icon: Icons.water_drop,
                  title: 'Milking Cow',
                  subtitle: 'Lactation period: 277 day',
                  color: Colors.pink,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.green, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Inseminated on Dec 30, 2024, 108 remaining days to estimated calving date',
                          style: TextStyle(color: Colors.green, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Basic Information Card
            CollapsibleCard(
              title: 'Basic Information',
              icon: Icons.arrow_upward,
              showEditButton: true,
              children: [
                InfoRow('Ear tag', 'RR 36'),
                InfoRow('Name', 'Female'),
                InfoRow('Gender', 'Female'),
                InfoRow('Breed', 'HF high%'),
                InfoRow('Birth Date', 'Aug 06, 2021'),
                InfoRow('Age', '3 years 10 months'),
                InfoRow('Dam ear tag', 'RR 2'),
                InfoRow('Sire name, tag', 'ABS stryker', showArrow: true),
                InfoRow('Notes', ''),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ActionButton(Icons.group, 'Herd / Paddock', 'Select Group'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ActionButton(Icons.restaurant, 'Ration Name', '22 litre diet straw'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Event Logs Card
            CollapsibleCard(
              title: 'Event Logs',
              icon: Icons.arrow_upward,
              showAddButton: true,
              children: [
                EventLogItem(
                  icon: Icons.thermostat,
                  event: 'Heat Period',
                  value: '22',
                  date: 'Nov 16',
                  color: Colors.red,
                ),
                EventLogItem(
                  icon: Icons.medication,
                  event: 'Deworming',
                  description: 'trimisol ds vet 4 bolus',
                  value: '14:10',
                  date: 'Nov 24',
                  color: Colors.green,
                ),
                EventLogItem(
                  icon: Icons.thermostat,
                  event: 'Heat Period',
                  value: '27',
                  date: 'Oct 24',
                  color: Colors.red,
                ),
                EventLogItem(
                  icon: Icons.child_care,
                  event: 'Gives Birth',
                  description: 'male calf',
                  value: '16:28',
                  date: 'Sep 24',
                  color: Colors.orange,
                ),
                EventLogItem(
                  icon: Icons.science,
                  event: 'Inseminated',
                  description: '(base red)',
                  value: '16:18',
                  date: 'Dec 23',
                  color: Colors.blue,
                ),
                EventLogItem(
                  icon: Icons.science,
                  event: 'wws',
                  value: '', // No value for this one in the image
                  date: 'Dec 23',
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Notifications (60 days) Card
            CollapsibleCard(
              title: 'Notifications (60 days)',
              icon: Icons.arrow_upward,
              showAddButton: true,
              children: [
                NotificationItem(
                  date: 'Aug 25',
                  title: 'DRY Period',
                  description: 'Drying date is upcoming, adjust feeding pattern in accordance with DRY period!',
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    const Text('Show completed notifications'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Cow Milk Yield Card
            CollapsibleCard(
              title: 'Cow Milk Yield',
              icon: Icons.arrow_upward,
              showAddButton: true,
              children: [
                MilkYieldHeader(),
                MilkYieldRow('Sep 20, 2024', '179.3', '5.4', '277'),
                MilkYieldRow('Jun 24, 2025', '', '', '277'),
              ],
            ),
            const SizedBox(height: 24),

            // Calves Card
            CollapsibleCard(
              title: 'Calves',
              icon: Icons.arrow_upward,
              showAddButton: true,
              children: [
                const Text(
                  'No calves, click the ⊕ button to add calves.',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
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


  // Helper function for Cattle State rows
  Widget StateRow({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper function for Basic Information rows
  Widget InfoRow(String label, String value, {bool showArrow = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              if (showArrow)
                const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function for action buttons in Basic Information
  Widget ActionButton(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.grey, size: 24),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[700], fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Helper function for Event Log items
  Widget EventLogItem({
    required IconData icon,
    required String event,
    String? description,
    required String value,
    required String date,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                if (description != null)
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                date,
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function for Notification item
  Widget NotificationItem({
    required String date,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple[50], // Light purple background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              date,
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function for Cow Milk Yield header
  Widget MilkYieldHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(child: Text('Period', style: TextStyle(color: Colors.grey, fontSize: 13))),
          Expanded(child: Text('Milk', textAlign: TextAlign.right, style: TextStyle(color: Colors.grey, fontSize: 13))),
          Expanded(child: Text('Daily', textAlign: TextAlign.right, style: TextStyle(color: Colors.grey, fontSize: 13))),
          Expanded(child: Text('DIM', textAlign: TextAlign.right, style: TextStyle(color: Colors.grey, fontSize: 13))),
        ],
      ),
    );
  }

  // Helper function for Cow Milk Yield rows
  Widget MilkYieldRow(String period, String milk, String daily, String dim) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(period, style: const TextStyle(fontSize: 14))),
          Expanded(child: Text(milk, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
          Expanded(child: Text(daily, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
          Expanded(child: Text(dim, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        ],
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<CattleDetailsLogic>(() => CattleDetailsLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return CattleDetailsI18n.getTranslations();
  }
}


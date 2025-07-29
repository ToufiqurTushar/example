import 'package:flutter_rapid/flutter_rapid.dart';
import 'config/app_system_config.dart';

void main() async {
  FlutterRapidApp flutterRapidApp = FlutterRapidApp();
  await flutterRapidApp.bStart(AppSystemConfig());
  runApp(flutterRapidApp);
}
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cattle Profile',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         fontFamily: 'Inter', // Using Inter font
//       ),
//       home: const CattleProfileScreen(),
//     );
//   }
// }
//
// class CattleProfileScreen extends StatelessWidget {
//   const CattleProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF2E4032), // Dark green from the image
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//         title: const Row(
//           children: [
//             CircleAvatar(
//               radius: 18,
//               backgroundColor: Colors.white, // Placeholder for avatar
//               child: Icon(Icons.person, color: Colors.grey),
//             ),
//             SizedBox(width: 8),
//             Text(
//               'RR 36',
//               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.more_vert, color: Colors.white),
//             onPressed: () {
//               // Handle more options
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Top Image and Add Photo Section
//             Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     height: 120,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(12),
//                       image: const DecorationImage(
//                         image: NetworkImage('https://placehold.co/600x400/E0E0E0/FFFFFF?text=Cattle+Image'), // Placeholder image
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.5),
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                           child: const Icon(Icons.star, color: Colors.white, size: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     height: 120,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.grey[400]!),
//                       //borderStyle: BorderStyle.dashed,
//                     ),
//                     child: const Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.add_a_photo, color: Colors.grey),
//                         SizedBox(height: 4),
//                         Text('Add Photo', style: TextStyle(color: Colors.grey)),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//
//             // Cattle State Card
//             _buildCard(
//               title: 'Cattle State',
//               icon: Icons.arrow_upward,
//               showAddButton: true,
//               children: [
//                 _buildStateRow(
//                   icon: Icons.pregnant_woman,
//                   title: 'Pregnancy Information',
//                   subtitle: 'Pregnant since Sep 20, 2024\nGestational period: 176 days\nCalving due date: Oct 18, 2025\n(92 day(s) later)',
//                   color: Colors.red,
//                 ),
//                 const SizedBox(height: 16),
//                 _buildStateRow(
//                   icon: Icons.water_drop,
//                   title: 'Milking Cow',
//                   subtitle: 'Lactation period: 277 day',
//                   color: Colors.pink,
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.green[50],
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: Colors.green),
//                   ),
//                   child: const Row(
//                     children: [
//                       Icon(Icons.info_outline, color: Colors.green, size: 20),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           'Inseminated on Dec 30, 2024, 108 remaining days to estimated calving date',
//                           style: TextStyle(color: Colors.green, fontSize: 13),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//
//             // Basic Information Card
//             _buildCard(
//               title: 'Basic Information',
//               icon: Icons.arrow_upward,
//               showEditButton: true,
//               children: [
//                 _buildInfoRow('Ear tag', 'RR 36'),
//                 _buildInfoRow('Name', 'Female'),
//                 _buildInfoRow('Gender', 'Female'),
//                 _buildInfoRow('Breed', 'HF high%'),
//                 _buildInfoRow('Birth Date', 'Aug 06, 2021'),
//                 _buildInfoRow('Age', '3 years 10 months'),
//                 _buildInfoRow('Dam ear tag', 'RR 2'),
//                 _buildInfoRow('Sire name, tag', 'ABS stryker', showArrow: true),
//                 _buildInfoRow('Notes', ''),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _buildActionButton(Icons.group, 'Herd / Paddock', 'Select Group'),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: _buildActionButton(Icons.restaurant, 'Ration Name', '22 litre diet straw'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//
//             // Event Logs Card
//             _buildCard(
//               title: 'Event Logs',
//               icon: Icons.arrow_upward,
//               showAddButton: true,
//               children: [
//                 _buildEventLogItem(
//                   icon: Icons.thermostat,
//                   event: 'Heat Period',
//                   value: '22',
//                   date: 'Nov 16',
//                   color: Colors.red,
//                 ),
//                 _buildEventLogItem(
//                   icon: Icons.medication,
//                   event: 'Deworming',
//                   description: 'trimisol ds vet 4 bolus',
//                   value: '14:10',
//                   date: 'Nov 24',
//                   color: Colors.green,
//                 ),
//                 _buildEventLogItem(
//                   icon: Icons.thermostat,
//                   event: 'Heat Period',
//                   value: '27',
//                   date: 'Oct 24',
//                   color: Colors.red,
//                 ),
//                 _buildEventLogItem(
//                   icon: Icons.child_care,
//                   event: 'Gives Birth',
//                   description: 'male calf',
//                   value: '16:28',
//                   date: 'Sep 24',
//                   color: Colors.orange,
//                 ),
//                 _buildEventLogItem(
//                   icon: Icons.science,
//                   event: 'Inseminated',
//                   description: '(base red)',
//                   value: '16:18',
//                   date: 'Dec 23',
//                   color: Colors.blue,
//                 ),
//                 _buildEventLogItem(
//                   icon: Icons.science,
//                   event: 'wws',
//                   value: '', // No value for this one in the image
//                   date: 'Dec 23',
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//
//             // Notifications (60 days) Card
//             _buildCard(
//               title: 'Notifications (60 days)',
//               icon: Icons.arrow_upward,
//               showAddButton: true,
//               children: [
//                 _buildNotificationItem(
//                   date: 'Aug 25',
//                   title: 'DRY Period',
//                   description: 'Drying date is upcoming, adjust feeding pattern in accordance with DRY period!',
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Checkbox(value: false, onChanged: (bool? value) {}),
//                     const Text('Show completed notifications'),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//
//             // Cow Milk Yield Card
//             _buildCard(
//               title: 'Cow Milk Yield',
//               icon: Icons.arrow_upward,
//               showAddButton: true,
//               children: [
//                 _buildMilkYieldHeader(),
//                 _buildMilkYieldRow('Sep 20, 2024', '179.3', '5.4', '277'),
//                 _buildMilkYieldRow('Jun 24, 2025', '', '', '277'),
//               ],
//             ),
//             const SizedBox(height: 24),
//
//             // Calves Card
//             _buildCard(
//               title: 'Calves',
//               icon: Icons.arrow_upward,
//               showAddButton: true,
//               children: [
//                 const Text(
//                   'No calves, click the ⊕ button to add calves.',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper function to build a common card structure
//   Widget _buildCard({
//     required String title,
//     required IconData icon,
//     List<Widget> children = const [],
//     bool showAddButton = false,
//     bool showEditButton = false,
//   }) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(icon, color: Colors.grey),
//                     const SizedBox(width: 8),
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     if (showEditButton)
//                       IconButton(
//                         icon: const Icon(Icons.edit, color: Colors.green),
//                         onPressed: () {
//                           // Handle edit button press
//                         },
//                       ),
//                     if (showAddButton)
//                       IconButton(
//                         icon: const Icon(Icons.add_circle_outline, color: Colors.green),
//                         onPressed: () {
//                           // Handle add button press
//                         },
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),
//             ...children,
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper function for Cattle State rows
//   Widget _buildStateRow({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required Color color,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, color: color, size: 28),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//               ),
//               Text(
//                 subtitle,
//                 style: TextStyle(color: Colors.grey[700], fontSize: 13),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Helper function for Basic Information rows
//   Widget _buildInfoRow(String label, String value, {bool showArrow = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(color: Colors.grey, fontSize: 14),
//           ),
//           Row(
//             children: [
//               Text(
//                 value,
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               ),
//               if (showArrow)
//                 const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Helper function for action buttons in Basic Information
//   Widget _buildActionButton(IconData icon, String title, String subtitle) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: Colors.grey, size: 24),
//           const SizedBox(height: 4),
//           Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
//             textAlign: TextAlign.center,
//           ),
//           Text(
//             subtitle,
//             style: TextStyle(color: Colors.grey[700], fontSize: 12),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Helper function for Event Log items
//   Widget _buildEventLogItem({
//     required IconData icon,
//     required String event,
//     String? description,
//     required String value,
//     required String date,
//     required Color color,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(6),
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(icon, color: color, size: 20),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   event,
//                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                 ),
//                 if (description != null)
//                   Text(
//                     description,
//                     style: TextStyle(color: Colors.grey[700], fontSize: 13),
//                   ),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 value,
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//               ),
//               Text(
//                 date,
//                 style: TextStyle(color: Colors.grey[700], fontSize: 13),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Helper function for Notification item
//   Widget _buildNotificationItem({
//     required String date,
//     required String title,
//     required String description,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.purple[50], // Light purple background
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.purple),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.purple,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Text(
//               date,
//               style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                 ),
//                 Text(
//                   description,
//                   style: TextStyle(color: Colors.grey[700], fontSize: 13),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Helper function for Cow Milk Yield header
//   Widget _buildMilkYieldHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: const [
//           Expanded(child: Text('Period', style: TextStyle(color: Colors.grey, fontSize: 13))),
//           Expanded(child: Text('Milk', textAlign: TextAlign.right, style: TextStyle(color: Colors.grey, fontSize: 13))),
//           Expanded(child: Text('Daily', textAlign: TextAlign.right, style: TextStyle(color: Colors.grey, fontSize: 13))),
//           Expanded(child: Text('DIM', textAlign: TextAlign.right, style: TextStyle(color: Colors.grey, fontSize: 13))),
//         ],
//       ),
//     );
//   }
//
//   // Helper function for Cow Milk Yield rows
//   Widget _buildMilkYieldRow(String period, String milk, String daily, String dim) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(child: Text(period, style: const TextStyle(fontSize: 14))),
//           Expanded(child: Text(milk, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
//           Expanded(child: Text(daily, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
//           Expanded(child: Text(dim, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
//         ],
//       ),
//     );
//   }
// }

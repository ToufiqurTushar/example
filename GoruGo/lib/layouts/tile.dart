import 'package:flutter/material.dart';
import 'package:flutter_rapid/flutter_rapid.dart';

Widget buildTile({
  required String title,
  required String count,
  required IconData icon,
  Color color = Colors.white,
}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade300),
    ),
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 14)),
        Text(count, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}





Widget pill(String label, IconData? icon, Color bgColor, double? fontSize) => Card(
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [if(icon!=null)Icon(icon, size: 18), if(icon!=null)const SizedBox(width: 4), Text(label, style: TextStyle(fontSize: fontSize),)],
    ),
  ),
);


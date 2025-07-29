import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final EdgeInsets? padding;
  final double? gap;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    this.titleStyle,
    this.subTitleStyle,
    this.padding,
    this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: padding??const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color),),
            SizedBox(height: gap??8),
            Text(title, style: titleStyle??Theme.of(context).textTheme.titleLarge),
            SizedBox(height: gap??8),
            Text(value, style: subTitleStyle??Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
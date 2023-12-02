import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final Text? subtitle; // Optional subtitle for additional text
  final IconData icon;
  final Widget? trailing; // Optional trailing widget
  final VoidCallback? onTap;

  const CustomCardWidget({
    Key? key,
    required this.title,
    this.subtitle, // Optional subtitle
    required this.icon,
    this.trailing, // Optional trailing widget
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: Icon(
            icon,
            size: 56.0, // Increased size of the icon
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 24), // Increased font size
          ),
          subtitle: subtitle, // Subtitle text
          trailing: trailing, // Trailing widget
        ),
      ),
    );
  }
}

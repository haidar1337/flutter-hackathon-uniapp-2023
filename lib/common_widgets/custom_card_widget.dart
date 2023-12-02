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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap, // Handling tap event
        child: SizedBox(
          height: 100,
          width: 100,
          child: Card(
            child: ListTile(
              leading: Icon(
                icon,
                size: 30,
              ),
              title: Center(
                  child: Text(
                title,
                style: const TextStyle(fontSize: 20),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

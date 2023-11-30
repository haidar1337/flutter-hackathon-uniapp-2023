import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap; // Added callback for tap event

  const CustomCardWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap, // Constructor parameter for tap event
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}

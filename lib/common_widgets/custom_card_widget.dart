import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final Text? subtitle; // Optional subtitle for additional text
  final IconData icon;
  final String? grade;
  final Widget? trailing; // Optional trailing widget
  final VoidCallback? onTap;
  final Color? color;

  const CustomCardWidget({
    Key? key,
    required this.title,
    this.subtitle, // Optional subtitle
    required this.icon,
    this.trailing, // Optional trailing widget
    this.onTap,
    this.grade,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap, // Handling tap event
        child: Card(
          child: Center(
            child: ListTile(
              leading: Icon(
                icon,
                size: 30,
              ),
              title: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  grade != null
                      ? Text(
                          " $grade",
                          style: TextStyle(
                              fontSize: 20,
                              color: color,
                              fontWeight: FontWeight.bold),
                        )
                      : const SizedBox(),
                ],
              ),
              subtitle: subtitle,
            ),
          ),
        ),
      ),
    );
  }
}

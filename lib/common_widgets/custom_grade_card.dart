import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/custom_card_widget.dart';

class CustomGradeCard extends StatelessWidget {
  const CustomGradeCard({required this.course, required this.index, super.key});
  final course;
  final index;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      title: course[index]["name"],
      subtitle: Text(course[index]["description"]),
      trailing: Text(course[index]["grade"],
          style: TextStyle(
              color: _getGradeColor(course[index]["grade"]),
              fontWeight: FontWeight.bold,
              fontSize: 20)),
      onTap: () {
        // Handle tap
      },
      icon: Icons.book,
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case "A+":
        return Colors.blue; // Starting A+ with blue
      case "A":
        return Colors.lightBlueAccent; // A lighter shade of blue for A
      case "B+":
        return Colors.greenAccent; // A lighter shade of green for B+
      case "B":
        return Colors.green; // Green for B
      case "C+":
        return Colors.yellowAccent; // Bright yellow for C+
      case "C":
        return Colors.yellow; // Standard yellow for C
      case "D+":
        return Colors.orangeAccent; // Lighter orange for D+
      case "D":
        return Colors.orange; // Standard orange for D
      case "F":
        return Colors.red; // Red for F
      default:
        return Colors.grey; // Grey for undefined grades
    }
  }
}

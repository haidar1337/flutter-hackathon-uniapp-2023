import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/custom_card_widget.dart';
import 'package:projectname/features/grades/data/class_course.dart';

class CustomGradeCard extends StatelessWidget {
  const CustomGradeCard({required this.course, super.key});
  final ClassCourse course;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      title: course.name!, // Display course name
      subtitle: Text(course.description!, // Display course description
          style: const TextStyle(fontSize: 16)),
      grade: course.grade!,
      color: _getGradeColor(course.grade!), // Color based on grade
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
            width: double.infinity,
            height: 300, // Adjusted height for better spacing
            child: Padding(
              padding: const EdgeInsets.all(12.0), // Padding for overall modal
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(course.name!,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  Text(course.description!,
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 15),
                  Text("Quizzes: ${course.quizzes!}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Mid-Term: ${course.midterm!}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Homeworks: ${course.homeworks!}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Final: ${course.finals!}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 15),
                  Text("Grade: ${course.grade!}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        );
      },
      icon: Icons.book,
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case "A+":
        return Colors.blue[800]!; // Deeper blue for A+
      case "A":
        return Colors.blue[700]!; // Deep blue for A
      case "B+":
        return Colors.green[600]!; // Deep green for B+
      case "B":
        return Colors.green[500]!; // Darker green for B
      case "C+":
        return Colors.amber[700]!; // Deep amber for C+
      case "C":
        return Colors.amber[600]!; // Darker amber for C
      case "D+":
        return Colors.deepOrange[700]!; // Deep orange for D+
      case "D":
        return Colors.deepOrange[600]!; // Darker orange for D
      case "F":
        return Colors.red[800]!; // Deep red for F
      default:
        return Colors.grey[600]!; // Darker grey for undefined grades
    }
  }
}

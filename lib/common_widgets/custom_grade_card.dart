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
                    child: Text(course[index]["name"],
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  Text(course[index]["description"],
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 15),
                  Text("Quizzes: ${course[index]['quizzes']}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Mid-Term: ${course[index]['midterm']}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Homeworks: ${course[index]['homeworks']}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Final: ${course[index]['final']}",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 15),
                  Text("Grade: ${course[index]["grade"]}",
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

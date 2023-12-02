import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/custom_card_widget.dart';
import 'package:projectname/common_widgets/custom_grade_card.dart';

class GradesPage extends StatefulWidget {
  const GradesPage({Key? key}) : super(key: key);

  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  final List<String> terms = [
    'Term 221',
    'Term 222',
    'Term 223',
    'Term 231',
    'Term 232'
  ];
  String? selectedTerm;
  double gpa = 0.0;

  @override
  void initState() {
    super.initState();
    // Assuming the initial GPA calculation is needed
    gpa = calculateGPA(CourseData.sampleData);
  }

  double calculateGPA(List<dynamic> courses) {
    if (courses.isEmpty) {
      return 0.0;
    }

    double totalPoints = 0;
    for (var course in courses) {
      totalPoints += _gradeToPoint(course["grade"]);
    }
    return totalPoints / courses.length;
  }

  double _gradeToPoint(String grade) {
    switch (grade) {
      case "A+":
        return 4.0;
      case "A":
        return 3.75;
      case "B+":
        return 3.5;
      case "B":
        return 3.0;
      case "C+":
        return 2.5;
      case "C":
        return 2.0;
      case "D+":
        return 1.5;
      case "D":
        return 1.0;
      case "F":
        return 0.0;
      default:
        return 0.0; // Default for undefined grades
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grades and GPA"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedTerm,
                  hint: const Text("Select Term"),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTerm = newValue;
                      // Update the GPA based on the selected term
                      // This is just an example. You might need to fetch the courses for the selected term.
                      gpa = calculateGPA(CourseData.sampleData);
                    });
                  },
                  items: terms.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                CustomCardWidget(
                  title: "GPA & Badge",
                  subtitle: Text("GPA: ${gpa.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 20)),
                  icon: Icons.school,
                  onTap: () {
                    // Handle tap
                  },
                ),
                ...List.generate(
                    CourseData.sampleData.length,
                    (index) => CustomGradeCard(
                          course: CourseData.sampleData,
                          index: index,
                        )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Mock class for CourseData, replace with your actual data model
class CourseData {
  static final _random = Random();

  static int _randomScore(int max) => _random.nextInt(max) + 1;

  static get sampleData => [
        {
          "name": "ICS 321",
          "description": "Database Systems",
          "grade": "A+",
          "quizzes": _randomScore(10), // Random score out of 10
          "midterm": _randomScore(25), // Random score out of 25
          "homeworks": _randomScore(15), // Random score out of 15
          "final": _randomScore(30), // Random score out of 30
        },
        {
          "name": "GS 332 ",
          "description": "Principles of Sociology",
          "grade": "A+",
          "quizzes": _randomScore(10),
          "midterm": _randomScore(25),
          "homeworks": _randomScore(15),
          "final": _randomScore(30),
        },
        {
          "name": "SWE 316",
          "description": "Software Design and Construction",
          "grade": "A+",
          "quizzes": _randomScore(10),
          "midterm": _randomScore(25),
          "homeworks": _randomScore(15),
          "final": _randomScore(30),
        }
      ];
}

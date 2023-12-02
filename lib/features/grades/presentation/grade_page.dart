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
                // GPA & Badge Card
                CustomCardWidget(
                  title: "GPA & Badge",
                  subtitle:
                      const Text("GPA: 3.75", style: TextStyle(fontSize: 20)),
                  icon: Icons.school,
                  onTap: () {
                    // Handle tap
                  },
                ),
                // Assuming 'courses' is a list of course data
                // Replace this with your actual data source
                ...List.generate(
                    3,
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
  static get sampleData => [
        {"name": "ICS 321", "description": "Database Systems", "grade": "A+"},
        {
          "name": "GS 332 ",
          "description": "Principles of Sociology",
          "grade": "A"
        },
        {
          "name": "SWE 316",
          "description": "Software Design and Construction",
          "grade": "A+"
        }
      ]; // Replace with actual data structure
}

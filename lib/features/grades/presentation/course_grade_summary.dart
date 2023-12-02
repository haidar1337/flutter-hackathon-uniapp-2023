import 'package:flutter/material.dart';

class CourseGradeSummary extends StatelessWidget {
  final Map<String, dynamic> courseData;

  const CourseGradeSummary({Key? key, required this.courseData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseData['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(),
          children: [
            _buildTableRow('Quizzes', courseData['quizzes']),
            _buildTableRow('Major 1', courseData['major1']),
            _buildTableRow('Major 2', courseData['major2']),
            _buildTableRow('Mid-Term', courseData['midTerm']),
            _buildTableRow('Project', courseData['project']),
            _buildTableRow('Final', courseData['final']),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String title, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value),
        ),
      ],
    );
  }
}

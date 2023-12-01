import 'package:flutter/material.dart';

class CustomEvaluationWidget extends StatelessWidget {
  final String courseName;
  final String instructor;
  final String date;
  final VoidCallback onTap;

  const CustomEvaluationWidget({
    Key? key,
    required this.courseName,
    required this.instructor,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Course: $courseName',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Instructor: $instructor',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Available Until: $date',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

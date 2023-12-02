import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectname/features/finalExamination/data/exam_data.dart';
import 'package:projectname/features/finalExamination/data/exam_repo.dart';
import 'package:projectname/features/finalExamination/presentation/card.dart';

// Should be coming from API or something
List<String> studentCourses = ["STAT319", "ENGL214", "MATH208", "CHE 204"];

class ExaminationPage extends StatefulWidget {
  const ExaminationPage({super.key});

  @override
  State<ExaminationPage> createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage> {
  List<dynamic> data = [];
  getData() async {
    final response = await ExamRepo.getExams();
    final Map parsed = json.decode(response);
    setState(() {
      data = parsed["exams"].map((e) => ExamData.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                // Set the AppBar icon color to white
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              elevation: 5,
              title: Text(
                'Your Final Exams Schedule',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onPrimary,
                  shadows: [
                    Shadow(
                      blurRadius: 1.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (studentCourses.contains(data[index].courseId)) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExamCard(data[index]),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          )
        : const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

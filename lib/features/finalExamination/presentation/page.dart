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
        ? ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              if (studentCourses.contains(data[index].courseId)) {
                return ExamCard(data[index]);
              }
              return const SizedBox.shrink();
            },
          )
        : const Center(child: CircularProgressIndicator());
  }
}

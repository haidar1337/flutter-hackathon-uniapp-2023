import 'package:flutter/material.dart';
import 'package:projectname/features/finalExamination/data/exam_data.dart';

class ExamCard extends StatelessWidget {
  const ExamCard(this.examData, {super.key});

  final ExamData examData;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    examData.courseId.isEmpty ? "None" : examData.courseId,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  Text(
                    examData.time.isEmpty ? "None" : examData.time,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(examData.day.isEmpty ? "None" : examData.day),
                  const Spacer(),
                  Text(examData.date.isEmpty ? "None" : examData.date),
                  const Spacer(),
                  Text(examData.location.isEmpty ? "None" : examData.location),
                ],
              ),
            ],
          ),
        ));
  }
}

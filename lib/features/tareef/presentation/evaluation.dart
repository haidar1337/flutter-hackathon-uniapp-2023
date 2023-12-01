import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/custom_evaluation_widget.dart';
import 'package:projectname/common_widgets/custom_question_widget.dart';

class Evaluation extends StatelessWidget {
  Evaluation({Key? key}) : super(key: key);

  final List<Question> questions = [
    Question(
      text: "How do you rate the course content?",
      answers: ["Excellent", "Good", "Average", "Below Average", "Poor"],
    ),
    // Add more questions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course Evaluations')),
      body: ListView(
        children: [
          CustomEvaluationWidget(
            courseName: 'SWE 316',
            instructor: 'Khalid Aljasser',
            date: '04/12/2023',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CustomQuestionsWidget(
                    courseName: 'SWE 316',
                    instructor: 'Khalid Aljasser',
                    questions: questions,
                  ),
                ),
              );
            },
          ),
          // Add more CustomEvaluationWidgets for other courses if needed
        ],
      ),
    );
  }
}

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
          'Evaluation',
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

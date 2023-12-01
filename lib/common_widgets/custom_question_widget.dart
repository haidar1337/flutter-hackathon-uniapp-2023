import 'package:flutter/material.dart';

class CustomQuestionsWidget extends StatefulWidget {
  final String courseName;
  final String instructor;
  final List<Question> questions;

  const CustomQuestionsWidget({
    Key? key,
    required this.courseName,
    required this.instructor,
    required this.questions,
  }) : super(key: key);
  @override
  State<CustomQuestionsWidget> createState() => _CustomQuestionsWidgetState();
}

class _CustomQuestionsWidgetState extends State<CustomQuestionsWidget> {
  String? currentAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.courseName} Questions')),
      body: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          var question = widget.questions[index];
          return Card(
            child: ListTile(
              title: Text(question.text),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: question.answers
                    .map(
                      (answer) => ListTile(
                        title: Text(answer),
                        leading: Radio<String>(
                          value: answer,
                          groupValue: currentAnswer,
                          onChanged: (String? value) {
                            setState(() {
                              currentAnswer = value;
                            });
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Question {
  String text;
  List<String> answers;
  Question({required this.text, required this.answers});
}

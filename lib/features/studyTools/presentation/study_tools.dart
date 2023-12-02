import 'package:flutter/material.dart';
import 'package:projectname/features/studyTools/data/tools_data.dart';
import 'package:projectname/features/studyTools/presentation/custom_card.dart';

class StudyToolsPage extends StatelessWidget {
  const StudyToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ToolData> toolsData = [
      ToolData(
        "Lecture Notes",
        "You can find all the lecture notes for all the courses you are taking current semester",
      ),
      ToolData(
        "Past Exams",
        "Past exams for all the courses you are taking current semester",
      ),
      ToolData(
        "Textbooks",
        "Textbooks for all the courses you are taking current semester",
      ),
      ToolData(
        "Flashcards",
        "Interactive flashcards for all the courses you are taking current semester",
      ),
      ToolData(
        "Study Groups",
        "Find classmates to study with",
      ),
      ToolData(
        "Study Plans",
        "Plan your study schedule for the semester",
      ),
      ToolData(
        "Study Tips",
        "Tips to help you study better",
      ),
      ToolData(
        "Study Tracker",
        "Track your study progress for the semester",
      ),
    ];
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
          'Study Tools',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(children: [
            Image.asset(
              'assets/kfupm.jpg',
              alignment: Alignment.center,
              height: 128,
              width: 128,
            ),
            const SizedBox(
              height: 12,
            ),
            ...toolsData
                .map(
                  (item) => CustomCard(item),
                )
                .toList(),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/home_custom_card.dart';
import 'package:projectname/features/evaluation/presentation/evaluation.dart';
import 'package:projectname/features/events/data/event_data.dart';
import 'package:projectname/features/events/presentation/event.dart';
import 'package:projectname/features/finalExamination/presentation/page.dart';
import 'package:projectname/features/studyTools/presentation/study_tools.dart';
import 'package:projectname/features/tareef/presentation/tareef.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        const HomeCustomCard(icon: Icons.qr_code_outlined, text: 'ATTENDANCE'),
        HomeCustomCard(
          text: 'EVENTS',
          icon: Icons.event,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Event(
                  eventData: EventData(
                    name: 'Test',
                    location: 'Test',
                    date: DateTime.now(),
                  ),
                ),
              ),
            );
          },
        ),
        HomeCustomCard(
          icon: Icons.text_snippet_outlined,
          text: 'FINAL EXAMINATION SCHEDULE',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ExaminationPage(),
              ),
            );
          },
        ),
        const HomeCustomCard(
          icon: Icons.assignment_outlined,
          text: 'ASSIGNMENTS',
        ),
        HomeCustomCard(
          icon: Icons.person_3_outlined,
          text: 'TAREEF',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Tareef(),
            ));
          },
        ),
        HomeCustomCard(
          icon: Icons.book_outlined,
          text: 'STUDY TOOLS & RESOURCES',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StudyToolsPage(),
            ));
          },
        ),
        HomeCustomCard(
          icon: Icons.feedback_outlined,
          text: 'FEEDBACK & EVALUATION TOOL',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Evaluation(),
            ));
          },
        ),
        const HomeCustomCard(
          icon: Icons.help_outline,
          text: 'HELP',
        ),
      ],
    );
  }
}

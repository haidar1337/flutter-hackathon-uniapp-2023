import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/home_custom_card.dart';
import 'package:projectname/features/finalExamination/presentation/page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        const HomeCustomCard(icon: Icons.qr_code_outlined, text: 'ATTENDANCE'),
        const HomeCustomCard(
          text: 'EVENTS',
          icon: Icons.event,
        ),
        HomeCustomCard(
          icon: Icons.text_snippet_outlined,
          text: 'FINAL EXAMINATION SCHEDULE',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExaminationPage(),
                ));
          },
        ),
        const HomeCustomCard(
          icon: Icons.assignment_outlined,
          text: 'ASSIGNMENTS',
        ),
        const HomeCustomCard(
          icon: Icons.person_3_outlined,
          text: 'TAREEF',
        ),
        const HomeCustomCard(
          icon: Icons.book_outlined,
          text: 'STUDY TOOLS & RESOURCES',
        ),
        const HomeCustomCard(
          icon: Icons.feedback_outlined,
          text: 'FEEDBACK & EVALUATION TOOL',
        ),
        const HomeCustomCard(
          icon: Icons.help_outline,
          text: 'HELP',
        ),
      ],
    );
  }
}

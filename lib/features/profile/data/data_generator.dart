import 'package:flutter/material.dart';
import 'package:projectname/features/profile/data/Student.dart';
import 'package:projectname/features/profile/data/row_generator.dart';

class dataGenerator extends StatelessWidget {
  Student? student;

  dataGenerator({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        RowGenerator(title: student!.name, icon: Icons.person),
        Divider(color: Colors.green.shade200, thickness: 1),
        const SizedBox(height: 20),
        RowGenerator(title: student!.stuId, icon: Icons.perm_identity),
        Divider(color: Colors.green.shade200, thickness: 1),
        const SizedBox(height: 20),
        RowGenerator(title: student!.email, icon: Icons.email),
        Divider(color: Colors.green.shade200, thickness: 1),
        const SizedBox(height: 20),
        RowGenerator(title: student!.govId, icon: Icons.numbers),
        Divider(color: Colors.green.shade200, thickness: 1),
        const SizedBox(height: 20),
        RowGenerator(title: student!.dateBirth, icon: Icons.date_range),
        Divider(color: Colors.green.shade200, thickness: 1),
        const SizedBox(height: 20),
        RowGenerator(title: student!.nationality, icon: Icons.nature_outlined),
        Divider(color: Colors.green.shade200, thickness: 1),
      ],
    );
  }
}

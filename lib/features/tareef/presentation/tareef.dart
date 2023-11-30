import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/custom_card_widget.dart';

class Tareef extends StatelessWidget {
  const Tareef({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("KFUPM Tareef", style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          CustomCardWidget(
            title: "Housing Contract",
            icon: Icons.house,
            onTap: () {},
          ),
          CustomCardWidget(
            title: "English Identification Letter",
            icon: Icons.perm_identity,
            onTap: () {},
          ),
          CustomCardWidget(
            title: "Arabic Identification Letter",
            icon: Icons.perm_identity,
            onTap: () {},
          ),
          CustomCardWidget(
            title: "Honor Letter",
            icon: Icons.star,
            onTap: () {},
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projectname/features/studyTools/data/tools_data.dart';
import 'package:projectname/features/studyTools/presentation/demo_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(this.item, {super.key});

  final ToolData item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const DemoPage()));
      },
      child: Card(
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
                    item.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                ],
              ),
              Text(item.description,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}

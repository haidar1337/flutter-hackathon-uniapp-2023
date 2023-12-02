import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/custom_event_widget.dart';
import 'package:projectname/features/events/data/event_data.dart';

class Event extends StatelessWidget {
  Event({super.key});

  final List<EventData> eventData = [
    EventData(
      name: 'Flutter Weekend Hackathon',
      location: 'Dhahran',
      date: DateTime(2023, 11, 29),
    ),
    EventData(
      name: 'Typing Speed Contest',
      location: 'KFUPM',
      date: DateTime(2023, 11, 05),
    ),
    EventData(
      name: 'Git & Github Workshop',
      location: 'KFUPM',
      date: DateTime(2023, 11, 25),
    ),
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
          'Events',
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
      body: CustomEventWidget(
        eventData: eventData,
      ),
    );
  }
}

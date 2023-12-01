import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/custom_event_widget.dart';
import 'package:projectname/features/events/data/event_data.dart';

class Event extends StatelessWidget {
  final EventData eventData;

  const Event({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(
            255, 16, 104, 17), // Set the AppBar background color to green
      ),
      body: CustomEventWidget(eventData: eventData),
    );
  }
}

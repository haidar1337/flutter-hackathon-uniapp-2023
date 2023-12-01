import 'package:flutter/material.dart';
import 'package:projectname/features/events/data/event_data.dart';

class CustomEventWidget extends StatelessWidget {
  final EventData eventData;

  const CustomEventWidget({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Set the width of the card
      height: 120, // Set the height of the card
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(eventData.name,
                  style: Theme.of(context).textTheme.titleLarge),
              Text(eventData.location,
                  style: Theme.of(context).textTheme.titleMedium),
              Text('Date: ${eventData.date.toLocal().toString().split(' ')[0]}',
                  style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ),
    );


import 'package:flutter/material.dart';
import 'package:projectname/features/events/data/event_data.dart';
import 'package:projectname/features/events/presentation/event.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Event App',
      theme: ThemeData(
        backgroundColor: Colors.green,
      ),
      home: Event(
        eventData: EventData(
          name: 'Flutter Weekend',
          location: 'KFUPM',
          date: DateTime.parse('2023-12-10'),
        ),
      ),
    );
  }
}

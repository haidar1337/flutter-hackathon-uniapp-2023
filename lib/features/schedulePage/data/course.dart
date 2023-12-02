import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Course extends Appointment {
  Course({
    required String courseName,
    required DateTime startTime,
    required DateTime endTime,
    required Color background,
    required bool isAllDay,
    required String location,
    required String recurrenceRule,
  }) : super(
            startTime: startTime,
            endTime: endTime,
            subject: courseName,
            color: background,
            isAllDay: isAllDay,
            recurrenceRule: recurrenceRule);
}

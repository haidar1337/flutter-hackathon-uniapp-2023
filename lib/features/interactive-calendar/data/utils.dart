import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';

class CalendarEvent {
  String title;
  String? description;
  DateTime? date;
  String id;

  CalendarEvent(this.title)
      : description = null,
        date = null,
        id = const Uuid().v4();
  CalendarEvent.withDescription(this.title, this.description)
      : date = null,
        id = const Uuid().v4();
  CalendarEvent.withDate(this.title, this.date)
      : description = null,
        id = const Uuid().v4();
  CalendarEvent.all(this.title, this.description, this.date)
      : id = const Uuid().v4();

  set setDescription(String? description) => this.description = description;
  set setDate(DateTime? date) => this.date = date;
  set setTitle(String title) => this.title = title;
  get getTitle => title;
  get getDescription => description;
  get getDate => date;

  @override
  String toString() => title;
}

final kCalendarEvents = LinkedHashMap<DateTime, List<CalendarEvent>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kCalendarEventSource);

final _kCalendarEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
        item % 4 + 1,
        (index) => CalendarEvent('CalendarEvent $item | ${index + 1}'))
}..addAll({
    kToday: [
      CalendarEvent.withDescription(
          'Today\'s CalendarEvent 1', 'A special CalendarEvent'),
      CalendarEvent.withDescription('Today\'s CalendarEvent 2', 'Also special'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 5, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 5, kToday.day);

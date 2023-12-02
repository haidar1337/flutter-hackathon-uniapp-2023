import 'package:flutter/material.dart';
import 'package:projectname/features/interactive-calendar/data/utils.dart';
import 'package:projectname/features/interactive-calendar/presentation/event_modal.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final ValueNotifier<List<CalendarEvent>> _selectedCalendarEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedCalendarEvents =
        ValueNotifier(_getCalendarEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedCalendarEvents.dispose();
    super.dispose();
  }

  List<CalendarEvent> _getCalendarEventsForDay(DateTime day) {
    return kCalendarEvents[day] ?? [];
  }

  List<CalendarEvent> _getCalendarEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getCalendarEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedCalendarEvents.value = _getCalendarEventsForDay(selectedDay);
    }
  }

  void _addCalendarEvent(CalendarEvent CalendarEvent) {
    setState(() {
      final CalendarEvents = _getCalendarEventsForDay(CalendarEvent.date!);
      CalendarEvents.add(CalendarEvent);
      kCalendarEvents[CalendarEvent.date!] = CalendarEvents;
    });
  }

  void _openOverlay([currentCalendarEvent]) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => EventModal(
        onAddEvent: _addCalendarEvent,
        currentEvent: currentCalendarEvent,
      ),
    );
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedCalendarEvents.value = _getCalendarEventsForRange(start, end);
    } else if (start != null) {
      _selectedCalendarEvents.value = _getCalendarEventsForDay(start);
    } else if (end != null) {
      _selectedCalendarEvents.value = _getCalendarEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar<CalendarEvent>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getCalendarEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          ValueListenableBuilder<List<CalendarEvent>>(
            valueListenable: _selectedCalendarEvents,
            builder: (context, value, _) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(value[index].id),
                      onDismissed: (direction) {
                        setState(() {
                          value.removeAt(index);
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _openOverlay(value[index]);
                                }),
                            title: Text(value[index].title),
                            subtitle: Text(value[index].description ?? ''),
                          )),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _openOverlay();
          },
          child: const Icon(Icons.add)),
    );
  }
}

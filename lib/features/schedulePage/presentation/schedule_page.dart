import 'package:flutter/material.dart';
import 'package:projectname/features/schedulePage/data/demo_data.dart';
import 'package:projectname/features/schedulePage/data/meeting.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  CalendarView view = CalendarView.day;
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.week,
      allowedViews: const [
        CalendarView.day,
        CalendarView.week,
        CalendarView.month
      ],
      onTap: (CalendarTapDetails details) {
        showModalBottomSheet(
            context: context,
            builder: (context) => (SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          details.appointments![0].subject.toString(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            details.appointments![0].startTime
                                .toString()
                                .substring(11, 16),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '-',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                              details.appointments![0].endTime
                                  .toString()
                                  .substring(11, 16),
                              style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Bldg 59 - Room 1010'),
                    ],
                  ),
                )));
      },
      dataSource: MeetingDataSource(courses),
      monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    );
  }
}

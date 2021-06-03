import 'package:schedule_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CalendarView currentCalendarView = CalendarView.month;
  Map<CalendarView, String> calendarViewList = {
    CalendarView.month: 'Month',
    CalendarView.day: 'Day',
    CalendarView.schedule: 'Schedule',
    CalendarView.week: 'Week',
    CalendarView.workWeek: 'Work week',
  };
  @override
  Widget build(BuildContext context) {
    return CustomCalendar();
  }
}

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      initialDisplayDate: DateTime.now(),
      view: CalendarView.month,
      viewNavigationMode: ViewNavigationMode.snap,
      allowedViews: [
        CalendarView.month,
        CalendarView.day,
        CalendarView.schedule,
        CalendarView.week,
        CalendarView.workWeek,
      ],
    );
  }
}

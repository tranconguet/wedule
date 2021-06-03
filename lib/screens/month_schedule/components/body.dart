import 'package:schedule_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  Map<CalendarView, double> appointmentFontSize = {
    CalendarView.month: 20,
    CalendarView.day: 18,
    CalendarView.schedule: 16,
    CalendarView.week: 14,
    CalendarView.workWeek: 12,
  };
  var controller = Get.find<EventsController>();
  var _calendarController = CalendarController();
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Your schedule",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Expanded(
          child: SfCalendar(
            controller: _calendarController,
            initialDisplayDate: DateTime.now(),
            view: CalendarView.month,
            allowViewNavigation: true,
            allowedViews: [
              CalendarView.month,
              CalendarView.day,
              CalendarView.schedule,
              CalendarView.week,
              CalendarView.workWeek,
            ],
            appointmentBuilder: (context, calendarAppointmentDetails) =>
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    calendarAppointmentDetails.appointments.elementAt(0).color,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  calendarAppointmentDetails.appointments.elementAt(0).subject,
                  style: TextStyle(
                      fontSize: appointmentFontSize[_calendarController.view],
                      color: Colors.white),
                ),
              ),
            ),
            monthViewSettings: MonthViewSettings(
              numberOfWeeksInView: 3,
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              monthCellStyle: MonthCellStyle(),
              appointmentDisplayCount: 4,
            ),
            dataSource: _getCalendarDataSource(),
          ),
        ),
      ],
    );
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointmentsList =
      Get.find<EventsController>().eventList.value.map((e) {
    return e.appointment;
  }).toList();

  for (var i = 0; i < appointmentsList.length; i++) {
    appointmentsList[i].color = getRandomColor();
  }
  return _AppointmentDataSource(appointmentsList);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

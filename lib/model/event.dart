import 'package:schedule_app/imports.dart';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

List<Event> eventListFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

class Event {
  Event({this.type, this.appointment, this.timer}) {
    DateTime now = DateTime.now();
    // identify event's status
    if (now.isBefore(appointment.startTime)) status = Status.notStarted;

    if (now.isAfter(appointment.endTime)) status = Status.expired;

    if (now.isAfter(appointment.startTime) && now.isBefore(appointment.endTime))
      status = Status.inProcess;

    // difference between startTime and endTime
    var difference =
        appointment.endTime.difference(appointment.startTime).inHours;
    if (difference > 24) {
      // more than a day
      eventLengthType = EventLengthType.long;
    } else {
      eventLengthType = EventLengthType.short;
    }
    if (timer.setTimer == 'On') {
      //timer is not set
      String title = appointment.notes;
      //timer is set
      if (timer.number != 0)
        title =
            appointment.subject + ' (${timer.number} ${timer.timeType} left)';

      CustomNotification().showNotification(
        notificationId: timer.notificationId,
        title: title,
        details: appointment.notes,
        time: appointment.endTime
            .add(-numberToDuration(timer.number, timer.timeType)),
      );
    } else {
      // edit event case
      if (Get.find<EventsController>()
          .getNotificationIdList()
          .contains(timer.notificationId))
        CustomNotification().deleteNotification(timer.notificationId);
    }
  }

  CustomTimer timer;
  EventLengthType eventLengthType;
  EventType type;
  Appointment appointment;
  Status status;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
      type: getEventTypeFromString(json["type"]),
      appointment: appointmentFromJson(json["appointment"]),
      timer: CustomTimer.fromJson(json["timer"]));

  Map<String, dynamic> toJson() => {
        "type": type.toString(),
        "appointment": appointmentToJSon(appointment),
        "timer": timer.toJson(),
      };
}

EventType getEventTypeFromString(String statusAsString) {
  for (EventType element in EventType.values) {
    if (element.toString() == statusAsString) {
      return element;
    }
  }
  return null;
}

Appointment appointmentFromJson(Map<String, dynamic> json) {
  return Appointment(
    startTime: DateTime.parse(json["startTime"]),
    endTime: DateTime.parse(json["endTime"]),
    subject: json["subject"],
    notes: json["notes"],
  );
}

Map<String, dynamic> appointmentToJSon(Appointment appointment) {
  return {
    "startTime": appointment.startTime.toString(),
    "endTime": appointment.endTime.toString(),
    "subject": appointment.subject,
    "notes": appointment.notes,
  };
}

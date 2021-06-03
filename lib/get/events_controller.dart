import 'package:schedule_app/imports.dart';

class EventsController extends GetxController {
  var eventList = List<Event>().obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    String userId = Get.find<UserController>().user.value.id;
    String currentProfileName = Get.find<UserController>().currentProfile.value;

    isLoading.value = true;
    eventList.value = await ApiServices.getEventListByProfileName(
      id: userId,
      name: currentProfileName,
    );
    isLoading.value = false;
    super.onInit();
  }

  List<int> getNotificationIdList() {
    return eventList.map((element) => element.timer.notificationId).toList();
  }

  List<int> getAvailableNotificationIdList() {
    return eventList
        .where((element) => element.timer.setTimer == 'On')
        .map((element) => element.timer.notificationId)
        .toList();
  }

  List<Event> getShortEventList() {
    List<Event> newList = eventList.value
        .where((element) => element.eventLengthType == EventLengthType.short)
        .toList();
    return newList;
  }

  List<Event> getLongEventList() {
    List<Event> newList = eventList.value
        .where((element) => element.eventLengthType == EventLengthType.long)
        .toList();
    return newList;
  }

  List<Event> getShortEventListOnDate(DateTime dt) {
    List<Event> newList = eventList.value
        .where((element) =>
            isSameDate(element.appointment.startTime, dt) &&
            element.eventLengthType == EventLengthType.short)
        .toList();
    return newList;
  }

  List<Event> getLongEventListOnDate(DateTime dt) {
    List<Event> newList = eventList.value
        .where((element) =>
            element.appointment.startTime
                .add(-Duration(days: 1))
                .isBefore(dt) &&
            element.appointment.endTime.add(Duration(days: 1)).isAfter(dt) &&
            element.eventLengthType == EventLengthType.long)
        .toList();
    return newList;
  }

  List<Event> getShortEventListFromNow() {
    List<Event> newList = eventList.value
        .where((element) =>
            element.appointment.endTime.isAfter(DateTime.now()) &&
            element.eventLengthType == EventLengthType.short)
        .toList();
    return newList;
  }

  addEvent(Event e) {
    List<Event> newList = eventList.value;
    newList.add(e);
    eventList.value = [];
    eventList.value = newList;
    var data = {
      "userId": Get.find<UserController>().user.value.id,
      "profileName": Get.find<UserController>().currentProfile.value,
      "events": json.encode(newList),
    };
    ApiServices.updateEventList(data);
  }

  deleteEvent(Event e) {
    CustomNotification().deleteNotification(e.timer.notificationId);
    List<Event> newList = eventList.value;
    newList.remove(e);
    eventList.value = [];
    eventList.value = newList;
    var data = {
      "userId": Get.find<UserController>().user.value.id,
      "profileName": Get.find<UserController>().currentProfile.value,
      "events": json.encode(newList),
    };
    ApiServices.updateEventList(data);
  }

  changeEvent({Event oldEvent, Event newEvent}) {
    List<Event> newList = eventList.value;
    newList.remove(oldEvent);
    newList.add(newEvent);
    eventList.value = [];
    eventList.value = newList;
    var data = {
      "userId": Get.find<UserController>().user.value.id,
      "profileName": Get.find<UserController>().currentProfile.value,
      "events": json.encode(newList),
    };
    ApiServices.updateEventList(data);
  }

  clear() {
    eventList.value = [];
    isLoading.value = false;
  }
}

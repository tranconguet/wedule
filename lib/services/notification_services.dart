import 'package:schedule_app/imports.dart';

class CustomNotification {
  CustomNotification({this.event}) {
    fltrNotification = new FlutterLocalNotificationsPlugin();
    androidInitilize = new AndroidInitializationSettings('app_icon');
    iOSinitilize = new IOSInitializationSettings();
    initilizationsSettings = new InitializationSettings(
        android: AndroidInitializationSettings('app_icon'),
        iOS: IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification));
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }
  Event event;
  FlutterLocalNotificationsPlugin fltrNotification;
  String task;
  int val;
  var androidInitilize;
  var iOSinitilize;
  var initilizationsSettings;

  Future showNotification(
      {int notificationId, DateTime time, String title, String details}) async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails(
        threadIdentifier: 'thread_id', subtitle: details);
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iSODetails);

    fltrNotification.schedule(
        notificationId, title, task, time, generalNotificationDetails);
  }

  Future deleteNotification(int id) async {
    fltrNotification.cancel(id);
  }

  Future notificationSelected(String payload) async {}

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) {
    return null;
  }
}

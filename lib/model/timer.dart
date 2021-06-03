// To parse this JSON data, do
//
//     final customTimer = customTimerFromJson(jsonString);

import 'package:schedule_app/imports.dart';

CustomTimer customTimerFromJson(String str) =>
    CustomTimer.fromJson(json.decode(str));

String customTimerToJson(CustomTimer data) => json.encode(data.toJson());

class CustomTimer {
  CustomTimer({
    this.setTimer,
    this.number,
    this.timeType,
    this.notificationId,
  });

  String setTimer;
  int number;
  int notificationId;
  String timeType;

  factory CustomTimer.fromJson(Map<String, dynamic> json) => CustomTimer(
        setTimer: json["setTimer"],
        number: json["number"],
        notificationId: json["notificationId"],
        timeType: json["timeType"],
      );

  Map<String, dynamic> toJson() => {
        "setTimer": setTimer,
        "number": number,
        "notificationId": notificationId,
        "timeType": timeType,
      };
}

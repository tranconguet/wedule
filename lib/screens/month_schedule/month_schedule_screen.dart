import 'package:flutter/material.dart';
import 'components/body.dart';

class MonthScheduleScreen extends StatelessWidget {
  static String routeName = "/month-schedule";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}

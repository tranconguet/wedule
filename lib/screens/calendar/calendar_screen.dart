import 'package:flutter/material.dart';
import 'components/body.dart';

class CalendarScreen extends StatelessWidget {
  static String routeName = "/calendar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: Body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:schedule_app/imports.dart';

import 'components/body.dart';

class ScheduleScreen extends StatelessWidget {
  static String routeName = "/schedule";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Get.to(() => MonthScheduleScreen());
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Text(
                      "See in calendar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}

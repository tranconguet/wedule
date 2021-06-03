import 'package:flutter/material.dart';
import 'components/body.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "/setting";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Body(),
    );
  }
}

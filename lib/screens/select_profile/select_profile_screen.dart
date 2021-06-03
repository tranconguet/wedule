import 'package:flutter/material.dart';
import 'components/body.dart';

class SelectProfileScreen extends StatelessWidget {
  static String routeName = "/select-profile";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}

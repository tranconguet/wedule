import 'package:flutter/material.dart';
import 'components/body.dart';

class EditWorkSectionScreen extends StatelessWidget {
  static String routeName = "/edit-work-section";
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(event: arguments),
    );
  }
}

import 'package:flutter/material.dart';

class TimeStreamPerSecond extends StatelessWidget {
  const TimeStreamPerSecond({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return child;
      },
    );
  }
}

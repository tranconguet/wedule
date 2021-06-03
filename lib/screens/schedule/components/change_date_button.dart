import 'package:flutter/material.dart';

class ChangeDayButton extends StatelessWidget {
  const ChangeDayButton({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final GestureTapCallback press;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: icon,
      ),
    );
  }
}

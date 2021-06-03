import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
    @required this.title,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String title;
  final String icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(icon),
                ),
                Text(title),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

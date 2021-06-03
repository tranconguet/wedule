import 'package:schedule_app/imports.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    Key key,
    this.press,
    this.text,
    this.icon,
    this.color,
    this.width,
  }) : super(key: key);

  final Color color;
  final Function press;
  final String text;
  final String icon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      width: width,
      child: FlatButton(
        onPressed: press,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(icon),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

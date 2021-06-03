import 'package:schedule_app/imports.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(fontSize: 20)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: kTextColor.withOpacity(0.2),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 3,
            )
          ],
        ),
      ),
    );
  }
}

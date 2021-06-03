import 'package:schedule_app/imports.dart';

class ChooseDateButton extends StatelessWidget {
  const ChooseDateButton({
    Key key,
    this.press,
  }) : super(key: key);

  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2030))
            .then((value) => press(value));
      },
      child: Container(
        margin: EdgeInsets.only(
          top: SizeConfig.screenHeight * 0.08,
          left: SizeConfig.screenWidth * 0.15,
        ),
        child: Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 60,
              width: 60,
              child: SvgPicture.asset(
                "assets/images/calendar1.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

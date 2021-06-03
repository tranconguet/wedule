import 'package:schedule_app/imports.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.2),
        Container(
          margin: EdgeInsets.only(bottom: 60),
          child: SvgPicture.asset(
            "assets/images/checked.svg",
            height: SizeConfig.screenHeight * 0.32,
          ),
        ),
        Text(
          "REGISTER SUCCESSFULLY!",
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        SizedBox(
          width: SizeConfig.screenWidth * 0.7,
          child: DefaultButton(
              text: "BACK TO LOGIN",
              press: () {
                Get.to(() => LoginScreen());
              }),
        )
      ],
    );
  }
}

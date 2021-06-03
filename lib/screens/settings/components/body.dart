import 'package:flutter/material.dart';
import 'package:schedule_app/imports.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingCard(
          text: "Change theme color",
          press: () {},
        ),
        SettingCard(
          text: "Change profile",
          press: () {
            Get.to(() => SelectProfileScreen());
          },
        ),
        SettingCard(
          text: "Notifications",
          press: () {},
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.5,
          child: ButtonWithIcon(
            text: "LOG OUT",
            color: Colors.lightBlue,
            press: () {
              clearController();
              Get.to(() => LoginScreen());
            },
            icon: "assets/images/exit.svg",
          ),
        ),
      ],
    );
  }
}

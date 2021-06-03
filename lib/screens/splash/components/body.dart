import 'package:schedule_app/imports.dart';
import 'package:schedule_app/screens/sign_up_success/sign_up_success_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var currentPage = 0;
  changePage(value) {
    setState(() {
      currentPage = value;
    });
  }

  var splashContents = [
    {
      "image": "assets/images/splash_1.svg",
      "descriptions":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
    },
    {
      "image": "assets/images/splash_2.svg",
      "descriptions":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
    },
    {
      "image": "assets/images/splash_3.svg",
      "descriptions":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          Text("WELCOME", style: titleTextStyle),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          SplashContents(
            splashContents: splashContents,
            changePage: changePage,
          ),
          SplashDots(splashContents: splashContents, currentPage: currentPage),
          SizedBox(height: SizeConfig.screenHeight * 0.07),
          DefaultButton(
            text: "GETTING STARTED",
            press: () {
              // Get.to(() => SelectProfileScreen());
              Get.to(() => LoginScreen());
              // Get.to(() => SettingScreen());
              // Get.to(() => SignUpSuccessScreen());
            },
          ),
        ],
      ),
    );
  }
}

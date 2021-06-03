import 'package:schedule_app/imports.dart';

class AnimatedSignUpPicture extends StatefulWidget {
  @override
  _AnimatedSignUpPictureState createState() => _AnimatedSignUpPictureState();
}

class _AnimatedSignUpPictureState extends State<AnimatedSignUpPicture> {
  double _dist = SizeConfig.screenWidth;

  @override
  initState() {
    super.initState();
    Future(() {
      setState(() {
        _dist = SizeConfig.screenWidth / 2 - 100;
      });
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Stack(
        children: [
          Container(height: 260),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            left: _dist,
            child: SvgPicture.asset(
              "assets/images/sign-up.svg",
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}

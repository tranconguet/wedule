import 'package:schedule_app/imports.dart';

class AnimatedLoginPicture extends StatefulWidget {
  const AnimatedLoginPicture({
    Key key,
  }) : super(key: key);

  @override
  _AnimatedLoginPictureState createState() => _AnimatedLoginPictureState();
}

class _AnimatedLoginPictureState extends State<AnimatedLoginPicture> {
  double _dist1 = 330;
  double _dist2 = -80;
  @override
  initState() {
    super.initState();
    Future(() {
      setState(() {
        _dist1 = 70;
        _dist2 = 220;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
      height: 360,
      width: double.infinity,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            left: _dist1,
            child: SvgPicture.asset(
              "assets/images/list.svg",
              height: 280,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: 170,
            left: _dist2,
            child: SvgPicture.asset(
              "assets/images/hour_glass.svg",
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}

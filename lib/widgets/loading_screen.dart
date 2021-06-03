import 'package:schedule_app/imports.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      color: kTextColor.withOpacity(0.4),
      child: Center(
        child: SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 10,
          ),
        ),
      ),
    );
  }
}

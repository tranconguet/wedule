import 'package:schedule_app/imports.dart';

class SplashContents extends StatelessWidget {
  const SplashContents({
    Key key,
    @required this.splashContents,
    this.changePage,
  }) : super(key: key);

  final List<Map<String, String>> splashContents;
  final Function changePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.45,
      child: PageView.builder(
        onPageChanged: (value) {
          changePage(value);
        },
        itemCount: splashContents.length,
        itemBuilder: (context, index) => Column(
          children: [
            SvgPicture.asset(
              splashContents[index]["image"],
              width: SizeConfig.screenWidth * 0.7,
            ),
            SizedBox(height: 30),
            Text(
              splashContents[index]["descriptions"],
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

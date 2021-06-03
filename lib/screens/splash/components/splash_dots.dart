import 'package:schedule_app/imports.dart';

class SplashDots extends StatelessWidget {
  const SplashDots({
    Key key,
    @required this.splashContents,
    @required this.currentPage,
  }) : super(key: key);

  final List<Map<String, String>> splashContents;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        ...List.generate(
          splashContents.length,
          (index) => Container(
              margin: EdgeInsets.all(5),
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: index == currentPage
                    ? Colors.lightBlue
                    : kSecondaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        Spacer(),
      ],
    );
  }
}

import 'package:schedule_app/imports.dart';

class Body extends StatelessWidget {
  var notification = CustomNotification(event: null);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print("hello");
            notification.showNotification(
                time: DateTime.now().add(Duration(seconds: 5)),
                details: "Wake up",
                title: "I'm hereeee");
          },
          child: Container(
            height: SizeConfig.screenHeight * 0.2,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

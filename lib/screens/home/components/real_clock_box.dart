import 'package:intl/intl.dart';
import 'package:schedule_app/imports.dart';

class RealTimeBox extends StatelessWidget {
  const RealTimeBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfig.screenHeight * 0.02,
          bottom: SizeConfig.screenHeight * 0.02),
      child: Align(
        alignment: Alignment.topCenter,
        child: StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                children: [
                  Text(
                    DateFormat('EEEE').format(DateTime.now()),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('MMM d').format(DateTime.now()),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('hh:mm:ss aaa').format(DateTime.now()),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:schedule_app/imports.dart';
import 'components/body.dart';

class WeatherScreen extends StatelessWidget {
  static String routeName = "/weather";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
      ),
      body: Body(),
    );
  }
}

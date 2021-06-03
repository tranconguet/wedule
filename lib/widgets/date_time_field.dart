import 'package:schedule_app/imports.dart';

class CustomDateTimeField extends StatelessWidget {
  const CustomDateTimeField({
    Key key,
    @required TextEditingController controller,
    this.title,
  })  : controller = controller,
        super(key: key);

  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: [
          Text(
            "${title}: ",
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: TimePicker(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}

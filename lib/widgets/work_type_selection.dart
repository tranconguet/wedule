import 'package:schedule_app/imports.dart';

class WorkTypeSelection extends StatelessWidget {
  const WorkTypeSelection({
    Key key,
    this.eventType,
  }) : super(key: key);

  final EventType eventType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          fromEventTypeToImage[eventType],
          height: 30,
        ),
        SizedBox(width: 10),
        Text(
          fromEventTypeToString[eventType],
          style: TextStyle(color: Colors.lightBlue, fontSize: 26),
        ),
      ],
    );
  }
}

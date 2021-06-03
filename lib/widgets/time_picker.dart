import 'package:intl/intl.dart';
import 'package:schedule_app/imports.dart';

class TimePicker extends StatefulWidget {
  TimePicker({
    Key key,
    @required TextEditingController controller,
  })  : controller = controller,
        super(key: key);

  final TextEditingController controller;

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  var format = DateFormat("yyyy-MM-dd HH:mm");

  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateTimeField(
          controller: widget.controller,
          format: format,
          validator: (value) {
            if (widget.controller.text == '') {
              setState(() {
                isError = true;
              });
              return "";
            }
            return null;
          },
          onChanged: (value) {
            if (value != null) {
              setState(() {
                isError = false;
              });
            }
          },
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
        ),
        isError
            ? Text("Please enter this field !",
                style: TextStyle(
                  color: Colors.red,
                ))
            : Container(),
      ],
    );
  }
}

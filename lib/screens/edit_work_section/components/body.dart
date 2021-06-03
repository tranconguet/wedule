import 'package:schedule_app/imports.dart';

class Body extends StatefulWidget {
  final Event event;

  const Body({Key key, this.event}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _titleController;
  TextEditingController _startTimeController;
  TextEditingController _endTimeController;
  TextEditingController _descriptionsController;
  TextEditingController _setTimeController;

  String setTimer;
  String timeType;
  var workType;
  bool isSelectedType = true;
  bool isTimeSetCorrect = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController =
        new TextEditingController(text: widget.event.appointment.subject);
    _startTimeController = new TextEditingController(
        text: widget.event.appointment.startTime.toString());
    _endTimeController = new TextEditingController(
        text: widget.event.appointment.endTime.toString());
    _descriptionsController =
        new TextEditingController(text: widget.event.appointment.notes);
    workType = widget.event.type;
    setTimer = widget.event.timer.setTimer;
    timeType = widget.event.timer.timeType;
    _setTimeController =
        new TextEditingController(text: widget.event.timer.number.toString());
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              NormalField(text: "Title", controller: _titleController),
              buildTypeSelection(),
              CustomDateTimeField(
                  title: "From", controller: _startTimeController),
              CustomDateTimeField(title: "To", controller: _endTimeController),
              BiggerTextField(
                  text: "Descriptions", controller: _descriptionsController),
              buildNotification(),
              isTimeSetCorrect
                  ? SizedBox()
                  : Text(
                      "Start time must be before end time of event !",
                      style: TextStyle(color: Colors.red),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWithIcon(
                    width: SizeConfig.screenWidth * 0.45,
                    color: Colors.lightBlue,
                    text: "SAVE",
                    icon: "assets/images/save.svg",
                    press: saveEvent,
                  ),
                  ButtonWithIcon(
                    width: SizeConfig.screenWidth * 0.45,
                    color: Colors.grey,
                    text: "CANCEL",
                    icon: "assets/images/trash.svg",
                    press: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  saveEvent() {
    if (_formKey.currentState.validate()) {
      if (workType != null) {
        if (DateTime.parse(_startTimeController.text)
            .isBefore(DateTime.parse(_endTimeController.text))) {
          // set time valid
          setState(() {
            isTimeSetCorrect = true;
          });
          //validate timer number
          int number;
          if (_setTimeController.text == '' ||
              int.parse(_setTimeController.text) < 0)
            number = 0;
          else
            number = int.parse(_setTimeController.text);
          // create new event
          Event newEvent = Event(
            type: workType,
            timer: CustomTimer(
              number: number,
              setTimer: setTimer,
              timeType: timeType,
              notificationId: widget.event.timer.notificationId,
            ),
            appointment: Appointment(
              subject: _titleController.text,
              startTime: DateTime.parse(_startTimeController.text),
              endTime: DateTime.parse(_endTimeController.text),
              notes: _descriptionsController.text,
            ),
          );
          Get.find<EventsController>()
              .changeEvent(oldEvent: widget.event, newEvent: newEvent);
          Get.back();
        } else {
          //set time invalid
          setState(() {
            isTimeSetCorrect = false;
          });
        }
      } else {
        //if workType isn't set
        setState(() {
          isSelectedType = false;
        });
      }
    }
  }

  Column buildNotification() {
    return Column(
      children: [
        Row(
          children: [
            Text("Set notification ", style: normalTextStyle),
            Container(
              height: 40,
              width: 40,
              child: SvgPicture.asset("assets/images/alarm.svg"),
            ),
            Text(" : ", style: normalTextStyle),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: DropdownButton<String>(
                value: setTimer,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.lightBlue,
                ),
                iconSize: 24,
                elevation: 16,
                onChanged: (String newValue) {
                  if (newValue != null)
                    setState(() {
                      setTimer = newValue;
                    });
                },
                items: ['On', 'Off'].map((e) {
                  // on, off 's color
                  Color cl;
                  if (e == 'On')
                    cl = Colors.lightGreen;
                  else
                    cl = Colors.red;
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(
                        e,
                        style: TextStyle(color: cl, fontSize: 26),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        // if On button clicked then timer box appears
        setTimer == 'On'
            ? Row(
                children: [
                  Text("Before: ", style: normalTextStyle),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _setTimeController,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: DropdownButton<String>(
                      value: timeType,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.lightBlue,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (String newValue) {
                        if (newValue != null)
                          setState(() {
                            timeType = newValue;
                          });
                      },
                      items: timeTypes.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Text(
                              e,
                              style: normalTextStyle,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  Column buildTypeSelection() {
    return Column(
      children: [
        Row(
          children: [
            Text("Type: ", style: normalTextStyle),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: DropdownButton<EventType>(
                value: workType,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.lightBlue,
                ),
                iconSize: 24,
                elevation: 16,
                onChanged: (EventType newValue) {
                  if (newValue != null)
                    setState(() {
                      isSelectedType = true;
                      workType = newValue;
                    });
                },
                items: EventType.values
                    .map(
                      (e) => DropdownMenuItem<EventType>(
                        value: e,
                        child: WorkTypeSelection(eventType: e),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        //about error
        !isSelectedType
            ? Text(
                "Please enter this field",
                style: TextStyle(color: Colors.red),
              )
            : Container(),
      ],
    );
  }
}

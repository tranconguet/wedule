import 'package:schedule_app/imports.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({
    Key key,
    @required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        DeleteButton(event: event),
      ],
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(15),
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blueGrey[200],
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(fromEventTypeToImage[event.type]),
                ),
                Text(
                  event.appointment.subject,
                  style: TextStyle(fontSize: 28, color: Colors.black),
                )
              ],
            ),
            Divider(
              color: Colors.blueGrey[200],
            ),
            Row(
              children: [
                Container(
                  width: SizeConfig.screenWidth * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "From: ${formatDateTime(event.appointment.startTime)}    To: ${formatDateTime(event.appointment.endTime)}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        event.appointment.notes,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Status: ",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          StreamBuilder(
                              stream:
                                  Stream.periodic(const Duration(seconds: 1))
                                      .asBroadcastStream(),
                              builder: (context, snapshot) {
                                Status status;
                                // identify event's status
                                if (DateTime.now()
                                    .isBefore(event.appointment.startTime))
                                  status = Status.notStarted;

                                if (DateTime.now()
                                    .isAfter(event.appointment.endTime))
                                  status = Status.expired;

                                if (DateTime.now()
                                        .isAfter(event.appointment.startTime) &&
                                    DateTime.now()
                                        .isBefore(event.appointment.endTime))
                                  status = Status.inProcess;
                                return Text(
                                  "${fromStatusToString[status]}",
                                  style: TextStyle(
                                    color: fromEventStatusToColor[status],
                                    fontSize: 18,
                                  ),
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(() => EditWorkSectionScreen(), arguments: event);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset("assets/images/edit.svg"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key key,
    @required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Do you want to delete this ?"),
            actions: [
              FlatButton(
                  onPressed: () async {
                    await Get.find<EventsController>().deleteEvent(event);
                    Navigator.pop(context);
                  },
                  child: Text("Yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No")),
            ],
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          top: 15,
          bottom: 15,
        ),
        padding: EdgeInsets.all(15),
        width: SizeConfig.screenWidth * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              height: 40,
              child: SvgPicture.asset("assets/images/trash.svg"),
            ),
            Text("Delete"),
          ],
        ),
      ),
    );
  }
}

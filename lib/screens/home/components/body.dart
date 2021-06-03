import 'package:schedule_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _eventController = Get.put(EventsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.lightBlue,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            RealTimeBox(),
            ContentContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuList(),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Now",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // current events
                  Expanded(
                    child: SingleChildScrollView(
                      child: !_eventController.isLoading.value
                          ? Column(
                              children: [
                                ...List.generate(
                                  _eventController
                                      .getShortEventListFromNow()
                                      .length,
                                  (index) => WorkCard(
                                    event: _eventController
                                        .getShortEventListFromNow()[index],
                                  ),
                                ),
                              ],
                            )
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

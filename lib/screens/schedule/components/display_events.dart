import 'package:schedule_app/imports.dart';

class DisplayEvents extends StatelessWidget {
  DisplayEvents({
    Key key,
    @required this.currentDate,
  }) : super(key: key);

  final DateTime currentDate;
  var eventListController = Get.find<EventsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: <Widget>[
                Tab(
                    child: Text("Short event",
                        style: TextStyle(color: kTextColor))),
                Tab(
                  child:
                      Text("Long event", style: TextStyle(color: kTextColor)),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  // display short events
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          eventListController
                              .getShortEventListOnDate(currentDate)
                              .length,
                          (index) => WorkCard(
                            event: eventListController
                                .getShortEventListOnDate(currentDate)[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // display long events
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          eventListController
                              .getLongEventListOnDate(currentDate)
                              .length,
                          (index) => WorkCard(
                            event: eventListController
                                .getLongEventListOnDate(currentDate)[index],
                          ),
                        ),
                      ],
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

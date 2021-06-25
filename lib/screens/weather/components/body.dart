import 'package:intl/intl.dart';
import 'package:schedule_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController _pagecontroller;
  DateTime _currentDate;
  List<DateTime> _dateList = List<DateTime>.generate(
      4, (i) => DateTime.now().add(Duration(days: i - 2)));

  @override
  void initState() {
    _currentDate = DateTime.now();
    //center page
    _pagecontroller = PageController(initialPage: 2);
    super.initState();
  }

  Widget build(BuildContext context) {
    Function changeDate = (DateTime dt) {
      setState(() {
        _currentDate = dt;
        _dateList = List<DateTime>.generate(
            4, (i) => _currentDate.add(Duration(days: i - 2)));
        _pagecontroller.jumpToPage(2);
      });
    };

    return Container(
      color: Colors.lightBlue,
      child: Stack(
        children: [
          Column(
            children: [
              // display current date
              Container(
                height: SizeConfig.screenHeight * 0.09,
                margin: EdgeInsets.only(bottom: 30),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: PageView.builder(
                          itemCount: _dateList.length,
                          controller: _pagecontroller,
                          onPageChanged: (value) {
                            changeDate(_dateList[value]);
                          },
                          itemBuilder: (context, index) =>
                              DateBox(currentDate: _dateList[index]),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // back button
                        ChangeDayButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.lightBlue,
                          ),
                          press: () {
                            _pagecontroller.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                        SizedBox(width: SizeConfig.screenWidth * 0.5),
                        // forward button
                        ChangeDayButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.lightBlue,
                          ),
                          press: () {
                            _pagecontroller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ContentContainer(
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
          ChooseDateButton(press: changeDate),
        ],
      ),
    );
  }
}

class ChangeTimeBox extends StatelessWidget {
  const ChangeTimeBox({
    Key key,
    @required List<DateTime> dateList,
    @required PageController pagecontroller,
    @required this.changeDate,
  })  : _dateList = dateList,
        _pagecontroller = pagecontroller,
        super(key: key);

  final List<DateTime> _dateList;
  final PageController _pagecontroller;
  final Function changeDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            child: PageView.builder(
              itemCount: _dateList.length,
              controller: _pagecontroller,
              onPageChanged: (value) {
                changeDate(_dateList[value]);
              },
              itemBuilder: (context, index) =>
                  DateBox(currentDate: _dateList[index]),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // back button
            ChangeDayButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.lightBlue,
              ),
              press: () {
                _pagecontroller.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.5),
            // forward button
            ChangeDayButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.lightBlue,
              ),
              press: () {
                _pagecontroller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class DateBox extends StatelessWidget {
  const DateBox({
    Key key,
    @required this.currentDate,
  }) : super(key: key);

  final DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat('EEEE').format(currentDate),
          style: TextStyle(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          DateFormat('MMM d').format(currentDate),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

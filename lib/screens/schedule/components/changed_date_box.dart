import 'package:intl/intl.dart';
import 'package:schedule_app/imports.dart';

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

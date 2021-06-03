import 'package:schedule_app/imports.dart';

class MenuList extends StatelessWidget {
  MenuList({
    Key key,
  }) : super(key: key);

  var menuItems = [
    Category(
      title: "Your Schedule",
      icon: "assets/images/notebook.svg",
      press: () {
        Get.to(() => ScheduleScreen());
      },
    ),
    Category(
      title: "Calendar",
      icon: "assets/images/calendar.svg",
      press: () {
        Get.to(() => CalendarScreen());
      },
    ),
    Category(
      title: "Weather",
      icon: "assets/images/cloudy.svg",
      press: () {
        Get.to(() => WeatherScreen());
      },
    ),
    Category(
      title: "Setting",
      icon: "assets/images/settings.svg",
      press: () {
        Get.to(() => SettingScreen());
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
          menuItems.length,
          (index) => MenuItem(
            title: menuItems[index].title,
            icon: menuItems[index].icon,
            press: menuItems[index].press,
          ),
        ),
      ],
    );
  }
}

class Category {
  Category({
    this.icon,
    this.press,
    this.title,
  });
  String title;
  String icon;
  Function press;
}

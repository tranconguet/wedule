import 'package:intl/intl.dart';
import 'imports.dart';

Map<EventType, String> fromEventTypeToImage = {
  EventType.sport: "assets/images/sports.svg",
  EventType.study: "assets/images/study.svg",
  EventType.work: "assets/images/work.svg",
  EventType.camping: "assets/images/tent.svg",
  EventType.cooking: "assets/images/cooking.svg",
  EventType.shopping: "assets/images/shopping.svg",
  EventType.eating: "assets/images/food-blogger.svg",
  EventType.hanging: "assets/images/friends.svg",
  EventType.sleep: "assets/images/sleeping.svg",
  EventType.relax: "assets/images/listen_music.svg",
};

Map<EventType, String> fromEventTypeToString = {
  EventType.sport: "Sport",
  EventType.study: "Study",
  EventType.work: "Work",
  EventType.camping: "Camping",
  EventType.cooking: "Cooking",
  EventType.shopping: "Shopping",
  EventType.eating: "Eating",
  EventType.hanging: "Hang out",
  EventType.sleep: "Sleep",
  EventType.relax: "Relax",
};

Map<Status, String> fromStatusToString = {
  Status.expired: "Expired",
  Status.inProcess: "In the process",
  Status.notStarted: "Not Started Yet",
};

String formatDateTime(DateTime dt) {
  DateFormat dateFormat = DateFormat(" HH:mm");
  String rs = "${weekDays[dt.weekday]} " + dateFormat.format(dt);
  return rs;
}

Map<Status, Color> fromEventStatusToColor = {
  Status.inProcess: Colors.yellowAccent,
  Status.expired: Colors.red,
  Status.notStarted: kTextColor,
};

Duration numberToDuration(int number, String type) {
  switch (type) {
    case 'seconds':
      return Duration(seconds: number);
      break;
    case 'minutes':
      return Duration(minutes: number);

      break;
    case 'hours':
      return Duration(hours: number);

      break;
    case 'weeks':
      return Duration(hours: number * 24 * 7);

      break;
    case 'days':
      return Duration(hours: number * 24);

      break;
    case 'month':
      return Duration(seconds: number * 24 * 30);
      break;
    default:
  }
}

Color getRandomColor() {
  var random = new Random().nextInt(colorList.length);
  return colorList[random];
}

int generateNumberIdFromIdList(List<int> list) {
  int id = 0;
  while (true) {
    if (!list.contains(id)) {
      return id;
    }
    id++;
  }
}

bool isProfileNameExist(String profileName) {
  List<String> profileNameList = Get.find<UserController>()
      .user
      .value
      .profiles
      .map((e) => e.profileName)
      .toList();
  return profileNameList.contains(profileName);
}

bool isSameDate(DateTime dt1, DateTime dt2) {
  return dt1.year == dt2.year && dt1.month == dt2.month && dt1.day == dt2.day;
}

clearController() {
  Get.find<AuthController>().clear();
  Get.find<EventsController>().clear();
  Get.find<UserController>().clear();
}

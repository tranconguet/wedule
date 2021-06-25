import 'package:schedule_app/imports.dart';

enum Status {
  notStarted,
  inProcess,
  expired,
}

enum EventType {
  sport,
  study,
  work,
  sleep,
  shopping,
  cooking,
  camping,
  hanging,
  eating,
  relax,
}

enum EventLengthType { long, short }

List<String> weekDays = [
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun"
];

List<String> timeTypes = [
  'seconds',
  'minutes',
  'hours',
  'days',
  'weeks',
  'month'
];

List<Color> colorList = [
  Colors.lightBlue,
  Colors.blueGrey,
  Colors.lightGreen,
  Colors.grey,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.pinkAccent,
];

const TextStyle normalTextStyle = TextStyle(
  fontSize: 26,
  color: Colors.black,
);
const TextStyle titleTextStyle = TextStyle(
  color: Colors.lightBlue,
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  color: Colors.lightGreen,
  fontSize: getProportionateScreenWidth(40),
  fontWeight: FontWeight.bold,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

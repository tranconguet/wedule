import 'imports.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SelectProfileScreen.routeName: (context) => SelectProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  EditWorkSectionScreen.routeName: (context) => EditWorkSectionScreen(),
  ScheduleScreen.routeName: (context) => ScheduleScreen(),
  MonthScheduleScreen.routeName: (context) => MonthScheduleScreen(),
  AddWorkScreen.routeName: (context) => AddWorkScreen(),
  CalendarScreen.routeName: (context) => CalendarScreen(),
  SettingScreen.routeName: (context) => SettingScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignUpSuccessScreen.routeName: (context) => SignUpSuccessScreen(),
  WeatherScreen.routeName: (context) => WeatherScreen(),
};

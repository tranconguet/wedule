import 'package:schedule_app/imports.dart';

class UserController extends GetxController {
  var user = User().obs;
  var currentProfile = ''.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  setUser(User usr) {
    user.value = usr;
  }

  setCurrentProfile(String curPrf) {
    currentProfile.value = curPrf;
  }

  createNewProfile(String profileName) async {
    User newUser = user.value;
    newUser.profiles.add(Profile(profileName: profileName, lastAccess: ""));
    user.value = User();
    user.value = newUser;
    await ApiServices.createNewProfile(
        user.value.id, user.value.profiles, profileName);
  }

  clear() {
    user.value = User(profiles: []);
    currentProfile.value = '';
  }
}

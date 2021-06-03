import 'package:schedule_app/imports.dart';

class Body extends StatelessWidget {
  var _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.lightBlue,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.1),
              height: SizeConfig.screenHeight * 0.1,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Select your profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ContentContainer(
              child: Column(
                children: [
                  CreateNewProfileButton(),
                  ...List.generate(
                    _userController.user.value.profiles.length,
                    (index) => ProfileUserCard(
                      avatar: "assets/images/male_avatar.svg",
                      name: _userController
                          .user.value.profiles[index].profileName,
                      lastAccess:
                          _userController.user.value.profiles[index].lastAccess,
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


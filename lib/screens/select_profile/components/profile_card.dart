import 'package:schedule_app/imports.dart';


class ProfileUserCard extends StatelessWidget {
  const ProfileUserCard({
    Key key,
    @required this.avatar,
    @required this.name,
    @required this.lastAccess,
  }) : super(key: key);

  final String avatar;
  final String name;
  final String lastAccess;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<UserController>().setCurrentProfile(name);
        Get.to(() => HomeScreen());
      },
      child: Container(
        margin: EdgeInsets.all(15),
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.2),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 3,
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 60,
              width: 60,
              child: SvgPicture.asset(avatar),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 10),
                Text(
                  "Last access: $lastAccess",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
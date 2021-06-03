import 'package:schedule_app/imports.dart';

class CreateNewProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: () {
          Get.defaultDialog(
            title: "Create new profile",
            content: CreateNewProfileDialogContent(),
            barrierDismissible: true,
          );
        },
        child: Container(
          margin: EdgeInsets.all(30),
          height: 40,
          width: 40,
          child: SvgPicture.asset("assets/images/plus.svg"),
        ),
      ),
    );
  }
}

class CreateNewProfileDialogContent extends StatefulWidget {
  @override
  _CreateNewProfileDialogContentState createState() =>
      _CreateNewProfileDialogContentState();
}

class _CreateNewProfileDialogContentState
    extends State<CreateNewProfileDialogContent> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController _newProfileNameController = new TextEditingController();

  bool isProfileNameExistError = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.8,
            child: CustomTextField(
              controller: _newProfileNameController,
              hintText: "Enter profile name",
              labelText: "Profile name",
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: SizeConfig.screenWidth * 0.5,
            child: ButtonWithIcon(
              text: "CREATE",
              color: Colors.lightBlue,
              icon: "assets/images/plus_2.svg",
              press: () {
                if (_formKey.currentState.validate()) {
                  if (!isProfileNameExist(_newProfileNameController.text)) {
                    //profile name doesn't exists
                    setState(() {
                      isProfileNameExistError = false;
                    });
                    Get.find<UserController>()
                        .createNewProfile(_newProfileNameController.text);
                    Get.back();
                  } else {
                    setState(() {
                      isProfileNameExistError = true;
                    });
                  }
                }
              },
            ),
          ),
          isProfileNameExistError
              ? Text(
                  "Profile name already exists",
                  style: TextStyle(color: Colors.red),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

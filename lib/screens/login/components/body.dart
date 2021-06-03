import 'package:schedule_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool isRememberedPassword = false;
  final _formKey = GlobalKey<FormState>();
  var _authController = Get.find<AuthController>();
  bool isPasswordCorrect = true;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(children: [
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                Text("SCHEDULE", style: titleTextStyle),
                AnimatedLoginPicture(),
                CustomTextField(
                  controller: _userNameController,
                  labelText: "User name",
                  hintText: "Enter your user name",
                ),
                CustomTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  isPassword: true,
                ),
                //error
                isPasswordCorrect
                    ? SizedBox()
                    : Text(
                        "User name or password is incorrect !",
                        style: TextStyle(color: Colors.red),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Row(
                    children: [
                      Checkbox(
                          value: isRememberedPassword, onChanged: (value) {}),
                      Text("Remember password"),
                      Spacer(),
                      Text(
                        "Forgot your password ?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                //login button
                SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: DefaultButton(text: "LOGIN", press: login),
                ),
                SignUp(),
              ],
            ),
          ),
        ),
        _authController.isLoading.value ? LoadingScreen() : SizedBox(),
      ]),
    );
  }

  void login() async {
    if (_formKey.currentState.validate()) {
      _authController.setIsLoading(true);
      String tk = await ApiServices.login(
          _userNameController.text, _passwordController.text);
      if (tk != null) {
        // password is correct
        setState(() {
          isPasswordCorrect = true;
        });
        Get.find<AuthController>().setToken(tk);
        User usr = await ApiServices.getInfoByToken(tk);
        Get.find<UserController>().setUser(usr);
        _authController.setIsLoading(false);
        Get.to(() => SelectProfileScreen());
      } else {
        //password is incorrect
        setState(() {
          isPasswordCorrect = false;
        });
        _authController.setIsLoading(false);
      }
    }
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        children: [
          Spacer(),
          Text(
            "Don't have an account ? ",
            style: TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => SignUpScreen());
            },
            child: Text(
              "Sign up",
              style:
                  TextStyle(decoration: TextDecoration.underline, fontSize: 16),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}

import 'package:schedule_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _rePasswordController = new TextEditingController();
  var _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  bool isLoading = false;

  addError(String error) {
    setState(() {
      errors.add(error);
    });
  }

  clearErrors() {
    setState(() {
      errors = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                Text("SIGN UP", style: titleTextStyle),
                AnimatedSignUpPicture(),
                CustomTextField(
                  controller: _userNameController,
                  labelText: "User name",
                  hintText: "Enter your user name",
                ),
                CustomTextField(
                  controller: _phoneNumberController,
                  labelText: "Phone number",
                  hintText: "Enter your phone number",
                ),
                CustomTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  isPassword: true,
                ),
                CustomTextField(
                  controller: _rePasswordController,
                  labelText: "Password",
                  hintText: "Re-type your password",
                  isPassword: true,
                ),
                // display errors
                ...List.generate(
                    errors.length,
                    (index) => Text(
                          errors[index],
                          style: TextStyle(color: Colors.red),
                        )),
                //sign up button
                SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: DefaultButton(text: "SIGN UP", press: signUp),
                ),
              ],
            ),
            isLoading ? LoadingScreen() : SizedBox(),
          ],
        ),
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      if (_passwordController.text == _rePasswordController.text) {
        //sign-up
        clearErrors();
        setState(() {
          isLoading = true;
        });
        //ignore phone number
        var result = await ApiServices.register(
            _userNameController.text, _passwordController.text);
        if (result != null) {
          if (result == "userName already exists") {
            addError("User name already exists");
            setState(() {
              isLoading = false;
            });
          } else if (result ==
              "\"password\" length must be at least 6 characters long") {
            addError("Password length must be at least 6 characters long");
            setState(() {
              isLoading = false;
            });
          } else {
            //register successfully
            setState(() {
              isLoading = false;
            });
            Get.to(() => SignUpSuccessScreen());
          }
        } else {
          // something wrong
          setState(() {
            isLoading = false;
          });
          Get.snackbar("Error", "Something wrong with server!");
        }
      } else {
        //re-password is wrong
      }
    }
  }
}

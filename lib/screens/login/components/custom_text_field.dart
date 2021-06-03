import 'package:schedule_app/imports.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final bool isNumber;

  const CustomTextField(
      {Key key,
      this.controller,
      this.labelText,
      this.hintText,
      this.isPassword = false,
      this.isNumber = false})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword,
            keyboardType:
                widget.isNumber ? TextInputType.number : TextInputType.text,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  isError = false;
                });
              }
            },
            validator: (value) {
              if (value.isEmpty) {
                setState(() {
                  isError = true;
                });
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              labelStyle: TextStyle(
                fontSize: 18,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // suffixIcon: CustomSurffixIcon(
              //   surffixIcon: "assets/icons/Mail.svg",
              // ),
            ),
          ),
          isError
              ? Text(
                  "Please enter this field !",
                  style: TextStyle(color: Colors.red),
                )
              : Container(),
        ],
      ),
    );
  }
}

import 'package:schedule_app/imports.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}

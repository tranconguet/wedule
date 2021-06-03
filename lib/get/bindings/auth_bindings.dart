import 'package:schedule_app/imports.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController(), permanent: true);
    // TODO: implement dependencies
  }
}

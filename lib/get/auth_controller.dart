import 'package:schedule_app/imports.dart';

class AuthController extends GetxController {
  var token = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  setIsLoading(bool value) {
    isLoading.value = value;
  }

  setToken(String tk) {
    token.value = tk;
  }

  clear() {
    token.value = '';
    isLoading.value = false;
  }
}

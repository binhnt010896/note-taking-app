import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/helpers/popups.dart';
import 'package:note_taking_app/repositories/auth_repository.dart';
import 'package:note_taking_app/services/localstorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../helpers/validator.dart';

class AuthController extends GetxController with StateMixin {
  final AuthRepository authRepository = AuthRepository();
  final supabase = Supabase.instance.client;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  var isAuth = false.obs;
  var isLoginScreen = true.obs;

  @override
  onInit() {
    super.onInit();
    if (supabase.auth.currentUser != null) {
      isAuth(true);
    }
    change(null, status: RxStatus.empty());
  }

  signUp(context) {
    change(null, status: RxStatus.loading());
    try {
      validateSignup(emailController.text, passwordController.text, passwordConfirmController.text);
      authRepository.signUp(emailController.text, passwordController.text);
      change(null, status: RxStatus.success());
      isAuth(true);
      Get.back();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      showSnackBar(context, text: e.toString(), snackBarType: SnackBarType.error);
    }
  }

  login(context) async {
    change(null, status: RxStatus.loading());
    try {
      validateLogin(emailController.text, passwordController.text);
      await authRepository.login(emailController.text, passwordController.text);
      change(null, status: RxStatus.success());
      isAuth(true);
      Get.back();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      showSnackBar(context, text: e.toString(), snackBarType: SnackBarType.error);
    }
  }

  navigateToSignUp() {
    isLoginScreen(false);
    update();
  }
  navigateToLogin() {
    isLoginScreen(true);
    update();
  }
}
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Widget _renderInputField(TextEditingController controller, {bool isObscured = false, String hintText = ''}) {
    InputBorder defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8)
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          hintText: hintText
        ),
        obscureText: isObscured,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.isLoginScreen.isTrue ? 'Login' : 'Signup'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _renderInputField(controller.emailController, hintText: 'Your email'),
                    _renderInputField(controller.passwordController, isObscured: true, hintText: 'Don\'t enter your real password here ;)'),
                    if (controller.isLoginScreen.isFalse)
                      _renderInputField(controller.passwordConfirmController, isObscured: true, hintText: 'Repeat the password here!'),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (controller.isLoginScreen.isFalse) {
                      controller.signUp(context);
                    } else {
                      controller.login(context);
                    }
                  },
                  child: Center(
                    child: controller.status.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(controller.isLoginScreen.isFalse ? 'Sign Up' : 'Login'),
                  ),
                ),
                const SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: controller.isLoginScreen.isFalse
                            ? 'Already had an account? '
                            : 'Don\'t have an account yet? '),
                        TextSpan(
                          text: controller.isLoginScreen.isFalse
                              ? 'Login now!'
                              : 'Sign up for one!',
                          style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              if (controller.isLoginScreen.isFalse ) {
                                controller.navigateToLogin();
                              } else {
                                controller.navigateToSignUp();
                              }
                            },
                        )
                      ]
                  )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

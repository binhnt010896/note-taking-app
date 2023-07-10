import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/controllers/auth_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        User? currentUser = controller.supabase.auth.currentUser;
        if (currentUser == null) return Container();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You\'re currently signed in as:'),
                const SizedBox(height: 16),
                Text(currentUser.email ?? '-', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () => controller.signOut(context),
                    child: Center(
                      child: controller.status.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Sign out'),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

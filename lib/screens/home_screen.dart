import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/controllers/auth_controller.dart';
import 'package:note_taking_app/controllers/note_list_controller.dart';
import 'package:note_taking_app/routes.dart';
import 'package:note_taking_app/widgets/note_list_item.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Taking App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) {
                if (controller.isAuth.isFalse) {
                  return TextButton(
                    onPressed: () => Get.toNamed(RouteNames.LOGIN_SCREEN),
                    child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
                  );
                }
                return IconButton(
                  onPressed: () => Get.toNamed(RouteNames.PROFILE_SCREEN),
                  icon: Icon(Icons.verified_user, color: Colors.white),
                );
              },
            ),
          )
        ],
      ),
      body: Center(
        child: GetBuilder<NoteListController>(
          init: NoteListController(),
          builder: (controller) {
            if (controller.status.isLoading) {
              return const CircularProgressIndicator();
            }
            if (controller.status.isSuccess) {
              return SizedBox(
                width: Get.width,
                height: Get.height - kToolbarHeight,
                child: RefreshIndicator(
                  onRefresh: () async => controller.getNotes(),
                  child: ListView(
                    children: controller.state!.map((item) {
                      return NoteListItem(item: item);
                    }).toList(),
                  ),
                ),
              );
            }
            return const Text('Nothing here');
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RouteNames.ADD_NEW_NOTE),
        tooltip: 'Add Edit note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
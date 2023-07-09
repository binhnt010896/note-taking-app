import 'package:get/get.dart';
import 'package:note_taking_app/screens/add_note_screen.dart';
import 'package:note_taking_app/screens/home_screen.dart';

class RouteNames {
  static const HOME_SCREEN = '/';
  static const ADD_NEW_NOTE = '/add_new_note';
}

var screenRoutes = [
  GetPage(name: RouteNames.HOME_SCREEN, page: () => const MyHomePage()),
  GetPage(name: RouteNames.ADD_NEW_NOTE, page: () => const CreateNoteScreen())
];
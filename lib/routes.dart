import 'package:get/get.dart';
import 'package:note_taking_app/screens/add_note_screen.dart';
import 'package:note_taking_app/screens/home_screen.dart';
import 'package:note_taking_app/screens/login_screen.dart';
import 'package:note_taking_app/screens/profile_screen.dart';

class RouteNames {
  static const HOME_SCREEN = '/';
  static const LOGIN_SCREEN = '/login';
  static const PROFILE_SCREEN = '/profile';
  static const ADD_NEW_NOTE = '/add_edit';
}

class ArgumentNames {
  static const IS_EDIT = 'is_edit';
}

var screenRoutes = [
  GetPage(name: RouteNames.HOME_SCREEN, page: () => const MyHomePage()),
  GetPage(name: RouteNames.LOGIN_SCREEN, page: () => const LoginScreen()),
  GetPage(name: RouteNames.PROFILE_SCREEN, page: () => const ProfileScreen()),
  GetPage(name: RouteNames.ADD_NEW_NOTE, page: () => const CreateNoteScreen())
];
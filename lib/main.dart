import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/routes.dart';
import 'package:note_taking_app/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://hqracorxnfusnjasygfc.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhxcmFjb3J4bmZ1c25qYXN5Z2ZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg3NDU3MDUsImV4cCI6MjAwNDMyMTcwNX0.uzZf_Gk4JofvfX0SIkTNOsaUwmLj_pEhZTPRJdLnZnk',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: screenRoutes,
      home: const MyHomePage(),
    );
  }
}

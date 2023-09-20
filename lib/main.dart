import 'package:flutter/material.dart';
import 'package:flutterclone/errorDialog/LoginError.dart';
import 'package:flutterclone/pages/login_screen.dart';

import 'package:flutterclone/pages/register_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //ensures the flutter widgets are loaded before firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();

  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        // home: const Responsive(
        //   mobile: Mobile(),
        //   desktop: Desktop(),
        // ));
        home: const LoginScreen());
  }
}

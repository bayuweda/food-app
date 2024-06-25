import 'package:flutter/material.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/pages/rawat_inap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/firebase_options.dart';
import 'pages/intro_page.dart';
import 'pages/menu_page.dart';
import 'pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key); // Memperbaiki parameter constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'loginpage', // Menetapkan rute awal
      routes: {
        'intropage': (context) => IntroPage(),
        'menupage': (context) => MenuPage(),
        'rawatpage': (context) => RawatPage(),
        'loginpage': (context) => LoginPage(),
      },
    );
  }
}

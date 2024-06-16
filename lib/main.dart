import 'package:flutter/material.dart';
import 'package:food_app/pages/rawat_inap.dart';
import 'pages/intro_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(MyApp()); // Memperbaiki pemanggilan MyApp() di dalam runApp
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key); // Memperbaiki parameter constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'intropage', // Menetapkan rute awal
      routes: {
        'intropage': (context) => IntroPage(),
        'menupage': (context) => MenuPage(),
        'rawatpage': (context) => RawatPage(),
      },
    );
  }
}

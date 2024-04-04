import 'package:flutter/material.dart';
import 'package:naeun_front/screens/tab_control_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naeun',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0045FF)),
        scaffoldBackgroundColor: const Color(0xffF2F4F6),
        appBarTheme: const AppBarTheme(
          color: Color(0xffF2F4F6),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TabControlScreen(index: 0,  recordTabNum: 0,),
    );
  }
}
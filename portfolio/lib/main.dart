import 'package:flutter/material.dart';
import 'package:portfolio/src/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            // seedColor: Color.fromRGBO(0, 200, 82, 255),
          )),
      home: const HomePage(),
    );
  }
}

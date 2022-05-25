import 'package:flutter/material.dart';
import 'package:portfolio/src/pages/home/home_page.dart';
import 'package:asuka/asuka.dart' as asuka;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: asuka.builder,
      navigatorObservers: [
        asuka.asukaHeroController //if u don`t add this Hero will not work
      ],
      title: 'PedroHenriqueDevBR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            // seedColor: Color(0XFF24FF78),
            // brightness: Brightness.dark,
          )),
      home: const HomePage(),
    );
  }
}

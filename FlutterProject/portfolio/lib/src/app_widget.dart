import 'package:flutter/material.dart';
import 'package:portfolio/src/pages/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portifólio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: Colors.lightBlue,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
      },
    );
  }
}

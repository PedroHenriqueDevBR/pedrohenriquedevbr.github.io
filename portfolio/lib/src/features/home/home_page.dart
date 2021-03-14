import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;

  changeTheme(value) {
    setState(() {
      isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.computer),
        actions: [
          TextButton(onPressed: () {}, child: Text('Home')),
          TextButton(onPressed: () {}, child: Text('Sobre')),
          TextButton(onPressed: () {}, child: Text('Projetos')),
          SizedBox(width: 8),
          Row(
            children: [
              Text(
                'Modo noturno',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Switch(
                value: isDark,
                onChanged: changeTheme,
                activeColor: Colors.orange,
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: Text('Funcionando'),
      ),
    );
  }
}

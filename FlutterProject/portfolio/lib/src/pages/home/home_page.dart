import 'package:flutter/material.dart';
import 'package:portfolio/src/pages/home/home_components.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeComponents {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Pedro - Portfólio',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          itemMenu(text: 'Home', action: () {}),
          SizedBox(width: 16.0),
          itemMenu(text: 'Sobre', action: () {}),
          SizedBox(width: 16.0),
          itemMenu(text: 'Projetos', action: () {}),
          SizedBox(width: 16.0),
          itemMenu(text: 'Contato', action: () {}),
          SizedBox(width: 16.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 64),
              width: MediaQuery.of(context).size.width,
              child: headDescription(context: context),
            ),
            Divider(),
            articleSection(context: context, title: 'Projetos', content: 'A seguir irei apresentar os meus principais projetos disponibilizados no Github.'),
          ],
        ),
      ),
    );
  }
}

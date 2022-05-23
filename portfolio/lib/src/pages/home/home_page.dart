import 'package:flutter/material.dart';
import 'package:portfolio/src/pages/home/pages/about/about_page.dart';
import 'package:portfolio/src/pages/home/pages/portfolio/portfolio_page.dart';
import 'package:portfolio/src/pages/home/pages/presentation/presentation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;

  void changePage(int page) {
    setState(() {
      selectedPageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('PedroHenriqueDevBR'),
      ),
      body: SingleChildScrollView(
        // physics: const PageScrollPhysics(),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: size.height,
              ),
              child: const PresentationPage(),
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: size.height,
              ),
              child: AboutPage(),
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: size.height,
              ),
              child: const PortfolioPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget railMenuWidget() => NavigationRail(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/avatar.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Pedro',
              ),
            ],
          ),
        ),
        selectedIndex: selectedPageIndex,
        onDestinationSelected: changePage,
        useIndicator: true,
        labelType: NavigationRailLabelType.selected,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: Text('Sobre'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.coffee_maker_outlined),
            selectedIcon: Icon(Icons.coffee_maker),
            label: Text('Portfólio'),
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:portfolio/src/pages/home/pages/about/about_page.dart';
import 'package:portfolio/src/pages/home/pages/portfolio/portfolio_page.dart';
import 'package:portfolio/src/pages/home/pages/presentation/presentation_page.dart';
import 'package:portfolio/src/shared/core/app_images.dart';
import 'package:responsive/logic.dart';

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
    // print('${size.width} == ${Responsive.gridSize(size.width)}');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.AVATAR,
              width: 40.0,
              height: 40.0,
            ),
            const SizedBox(width: 8.0),
            const Text('PedroHenriqueDevBR'),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Home'),
            onPressed: () {},
          ),
          TextButton(
            child: const Text('Sobre'),
            onPressed: () {},
          ),
          TextButton(
            child: const Text('Portfólio'),
            onPressed: () {},
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: SingleChildScrollView(
        physics: const RangeMaintainingScrollPhysics(),
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
            const PortfolioPage(),
          ],
        ),
      ),
    );
  }
}

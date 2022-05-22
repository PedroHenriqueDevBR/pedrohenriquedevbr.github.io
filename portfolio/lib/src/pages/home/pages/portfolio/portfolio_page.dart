import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/pages/home/pages/portfolio/stores/portfolio_store.dart';
import 'package:portfolio/src/pages/home/pages/portfolio/widgets/github_card_widget.dart';
import 'package:portfolio/src/shared/models/github_repository_model.dart';
import 'package:portfolio/src/shared/repositories/github_repository.dart';
import 'package:portfolio/src/shared/services/http_client_service.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  late PortfolioStore controller;
  final client = HttpClientService();

  @override
  void initState() {
    controller = PortfolioStore(
      context: context,
      storage: GithubRepository(client: client),
    );
    controller.populateRepositories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Portfólio',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
            ),
            const SizedBox(height: 16.0),
            Observer(
              builder: (contextBuilder) => controller.loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    )
                  : LayoutGrid(
                      columnSizes: [1.fr, 1.fr],
                      rowSizes: const [auto, auto, auto, auto, auto, auto],
                      columnGap: 8.0,
                      rowGap: 8.0,
                      gridFit: GridFit.loose,
                      children: controller.repositories != null
                          ? controller.repositories
                              .map((element) => GithubCardWidget(
                                    repository: element,
                                    onTap: () => controller.showDocumentation(
                                      element.name!,
                                      element.defaultBranch!,
                                    ),
                                  ))
                              .toList()
                          : [],
                    ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed:
                      controller.loading ? null : controller.goToGithubProfile,
                  child: const Text('Ver todos'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/src/pages/home/pages/portfolio/stores/portfolio_store.dart';
import 'package:portfolio/src/pages/home/pages/portfolio/widgets/github_card_widget.dart';
import 'package:portfolio/src/shared/core/responsive_endpoints.dart';
import 'package:portfolio/src/shared/repositories/github_repository.dart';
import 'package:portfolio/src/shared/services/http_client_service.dart';
import 'package:responsive/logic.dart';

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
    return Padding(
      padding: ResponsiveEndpoints.isDesktop(size.width)
          ? const EdgeInsets.symmetric(
              horizontal: 128.0,
              vertical: 32.0,
            )
          : const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '# Projetos',
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          const SizedBox(height: 32.0),
          Observer(
            builder: (contextBuilder) => controller.loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  )
                : LayoutGrid(
                    columnSizes: ResponsiveEndpoints.isMobile(size.width) ||
                            Responsive.gridSize(size.width) == Responsive.lg
                        ? [1.fr]
                        : [1.fr, 1.fr, 1.fr],
                    rowSizes: ResponsiveEndpoints.isMobile(size.width) ||
                            Responsive.gridSize(size.width) == Responsive.lg
                        ? const [
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                            auto,
                          ]
                        : const [
                            auto,
                            auto,
                            auto,
                            auto,
                          ],
                    columnGap: 32.0,
                    rowGap: 32.0,
                    gridFit: GridFit.loose,
                    children: controller.repositories != null
                        ? controller.repositories
                            .map(
                              (element) => GithubCardWidget(
                                repository: element,
                                onTap: () => controller.showDocumentation(
                                  element.name!,
                                  element.defaultBranch!,
                                  size.width,
                                ),
                              ),
                            )
                            .toList()
                        : [],
                  ),
          ),
          const SizedBox(height: 16.0),
          Observer(builder: (context) {
            return Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed:
                      controller.loading ? null : controller.goToGithubProfile,
                  child: const Text('Ver todos'),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

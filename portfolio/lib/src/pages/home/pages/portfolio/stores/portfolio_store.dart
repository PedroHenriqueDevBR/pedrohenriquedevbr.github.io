import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../shared/interfaces/github_storage_interface.dart';
import '../../../../../shared/models/github_repository_model.dart';

part 'portfolio_store.g.dart';

class PortfolioStore extends _PortfolioStore with _$PortfolioStore {
  PortfolioStore({
    required BuildContext context,
    required IGithubStorage storage,
  }) {
    super.storage = storage;
    super.pageContext = context;
  }
}

abstract class _PortfolioStore with Store {
  late IGithubStorage storage;
  late BuildContext pageContext;

  @observable
  bool loading = false;

  ObservableList<GitHubRepositoryModel> repositories =
      ObservableList<GitHubRepositoryModel>();

  @action
  void setLoading(bool value) => loading = value;

  void populateRepositories() async {
    try {
      setLoading(true);
      List<GitHubRepositoryModel> response = await storage.allRepositories();
      response.removeWhere((element) => element.fork == true);
      response.sort(
        (a, b) {
          return b.stargazersCount!.compareTo(a.stargazersCount!);
        },
      );
      List<GitHubRepositoryModel> result = [];
      for (int i = 0; i < 12; i++) {
        result.add(response[i]);
      }
      repositories.addAll(result);
    } catch (error) {
      if (kDebugMode) {
        print('Erro ao buscar repositorios');
        print(error);
      }
    } finally {
      setLoading(false);
    }
  }

  void goToGithubProfile() {
    launchUrlString('https://github.com/pedrohenriquedevbr');
  }

  void goToGithubRepository(String repositoryName) {
    launchUrlString('https://github.com/pedrohenriquedevbr/$repositoryName');
  }

  void showDocumentation(String repositoryName, String branchName) async {
    String docs = await storage.repositoryDocs(
      repositoryName: repositoryName,
      branchName: branchName,
    );

    asuka.showDialog(
      barrierColor: Theme.of(pageContext).colorScheme.onTertiaryContainer,
      builder: (buildContext) => Dialog(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(pageContext).colorScheme.tertiary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    repositoryName,
                    style: Theme.of(pageContext).textTheme.headline4!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: Theme.of(pageContext).colorScheme.onSecondary,
                        ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(buildContext),
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(pageContext).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Markdown(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 64.0,
                    ),
                    selectable: true,
                    data: docs,
                    extensionSet: md.ExtensionSet(
                      md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                      [md.EmojiSyntax()],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () => goToGithubRepository(repositoryName),
                      style: ElevatedButton.styleFrom(
                        onPrimary:
                            Theme.of(pageContext).colorScheme.tertiaryContainer,
                        primary: Theme.of(pageContext)
                            .colorScheme
                            .onTertiaryContainer,
                      ),
                      child: const Text('Acessar repositório'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // asuka.showModalBottomSheet(
    //   enableDrag: true,
    //   backgroundColor: Theme.of(pageContext).colorScheme.tertiaryContainer,
    //   builder: (context) => ,
    // );
  }
}

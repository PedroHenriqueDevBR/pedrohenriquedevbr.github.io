import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portfolio/src/shared/models/github_repository_model.dart';

class GithubCardWidget extends StatelessWidget {
  final GitHubRepositoryModel repository;
  final Function onTap;

  const GithubCardWidget({
    Key? key,
    required this.repository,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(),
      isThreeLine: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      tileColor: Theme.of(context).colorScheme.tertiaryContainer,
      leading: Icon(
        FontAwesomeIcons.githubAlt,
        color: Theme.of(context).colorScheme.onTertiaryContainer,
        size: 40,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          gitInfo(
              context, Icons.star_outlined, repository.stargazersCount ?? 0),
          const SizedBox(width: 8.0),
          gitInfo(
              context, FontAwesomeIcons.codeFork, repository.forksCount ?? 0),
        ],
      ),
      title: Text(
        repository.name ?? 'Sem nome',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        repository.description ?? 'Sem descrição no momento!',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget gitInfo(
    BuildContext context,
    IconData icon,
    int value,
  ) =>
      TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
        ),
        onPressed: null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(width: 4.0),
            Icon(
              icon,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 20,
            ),
          ],
        ),
      );
}

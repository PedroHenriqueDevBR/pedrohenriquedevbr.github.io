import '../models/github_repository_model.dart';

abstract class IGithubStorage {
  Future<List<GitHubRepositoryModel>> allRepositories();

  Future<String> repositoryDocs({
    required String repositoryName,
    required String branchName,
  });
}

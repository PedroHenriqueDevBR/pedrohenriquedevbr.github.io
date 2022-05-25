import '../interfaces/client_http_interface.dart';
import '../interfaces/github_storage_interface.dart';
import '../models/github_repository_model.dart';
import '../models/http_response_model.dart';
import '../exceptions/http_response_exception.dart';

class GithubRepository implements IGithubStorage {
  final IClientHTTP _client;
  Map<String, String> endpoints = {
    'repos': 'https://api.github.com/users/PedroHenriqueDevBR/repos',
    'docs':
        'https://raw.githubusercontent.com/PedroHenriqueDevBR/#repository/#branch/README.md',
  };

  GithubRepository({required IClientHTTP client}) : _client = client;

  @override
  Future<List<GitHubRepositoryModel>> allRepositories() async {
    String path = endpoints['repos']!;
    try {
      final response = await _client.get(path);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return GitHubRepositoryModel.fromJsonList(response.data);
      } else {
        throw HttpResponseException(
          response: HttpResponseModel(
            statusCode: response.statusCode,
            data: response.data,
          ),
        );
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<String> repositoryDocs({
    required String repositoryName,
    required String branchName,
  }) async {
    String path = endpoints['docs']!;
    path = path.replaceAll('#repository', repositoryName);
    path = path.replaceAll('#branch', branchName);
    try {
      final response = await _client.get(path);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.data.toString();
      } else {
        throw HttpResponseException(
          response: HttpResponseModel(
            statusCode: response.statusCode,
            data: response.data,
          ),
        );
      }
    } catch (error) {
      rethrow;
    }
  }
}

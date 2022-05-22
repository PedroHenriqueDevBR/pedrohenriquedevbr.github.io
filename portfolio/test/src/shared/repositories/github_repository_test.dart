import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/src/shared/interfaces/client_http_interface.dart';
import 'package:portfolio/src/shared/models/http_response_model.dart';
import 'package:portfolio/src/shared/repositories/github_repository.dart';

class HttpMock extends Mock implements IClientHTTP {}

void main() {
  final _client = HttpMock();

  GithubRepository _repository = GithubRepository(client: _client);

  test('Should get all repositories', () async {
    when(() => _client.get(any())).thenAnswer(
      (_) async => HttpResponseModel(
        statusCode: 200,
        data: respositoriesResponse,
      ),
    );

    final response = await _repository.allRepositories();

    expect(response.length, equals(2));

    expect(response[0].id, equals(474197268));
    expect(response[0].name, equals('adocao-animal-mobile'));
    expect(response[0].fullName,
        equals('PedroHenriqueDevBR/adocao-animal-mobile'));
    expect(response[0].htmlUrl,
        equals('https://github.com/PedroHenriqueDevBR/adocao-animal-mobile'));
    expect(response[0].description,
        equals('Aplicativo que consome dados do projeto adoção doguinho'));
    expect(response[0].fork, equals(false));
    expect(
        response[0].url,
        equals(
            'https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile'));
    expect(
        response[0].languagesUrl,
        equals(
            'https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/languages'));
    expect(
        response[0].stargazersUrl,
        equals(
            'https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/stargazers'));
    expect(
        response[0].cloneUrl,
        equals(
            'https://github.com/PedroHenriqueDevBR/adocao-animal-mobile.git'));
    expect(response[0].language, equals('Dart'));
    expect(response[0].forksCount, equals(0));
    expect(response[0].visibility, equals('public'));
    expect(response[0].stargazersCount, equals(0));
    expect(response[0].topics!.length, equals(0));
    expect(response[0].forks, equals(0));
    expect(response[0].defaultBranch, equals('main'));
  });

  test('Should return repository docs', () async {
    when(() => _client.get(any())).thenAnswer(
      (_) async => HttpResponseModel(
        statusCode: 200,
        data: docsResponse,
      ),
    );

    final response = await _repository.repositoryDocs(
      repositoryName: 'adocao-animal-mobile',
      branchName: 'main',
    );

    expect(response, isNotNull);
    expect(response, isA<String>());
  });
}

final respositoriesResponse = [
  {
    "id": 474197268,
    "node_id": "R_kgDOHEOtFA",
    "name": "adocao-animal-mobile",
    "full_name": "PedroHenriqueDevBR/adocao-animal-mobile",
    "private": false,
    "owner": {
      "login": "PedroHenriqueDevBR",
      "id": 36716898,
      "node_id": "MDQ6VXNlcjM2NzE2ODk4",
      "avatar_url": "https://avatars.githubusercontent.com/u/36716898?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/PedroHenriqueDevBR",
      "html_url": "https://github.com/PedroHenriqueDevBR",
      "followers_url":
          "https://api.github.com/users/PedroHenriqueDevBR/followers",
      "following_url":
          "https://api.github.com/users/PedroHenriqueDevBR/following{/other_user}",
      "gists_url":
          "https://api.github.com/users/PedroHenriqueDevBR/gists{/gist_id}",
      "starred_url":
          "https://api.github.com/users/PedroHenriqueDevBR/starred{/owner}{/repo}",
      "subscriptions_url":
          "https://api.github.com/users/PedroHenriqueDevBR/subscriptions",
      "organizations_url":
          "https://api.github.com/users/PedroHenriqueDevBR/orgs",
      "repos_url": "https://api.github.com/users/PedroHenriqueDevBR/repos",
      "events_url":
          "https://api.github.com/users/PedroHenriqueDevBR/events{/privacy}",
      "received_events_url":
          "https://api.github.com/users/PedroHenriqueDevBR/received_events",
      "type": "User",
      "site_admin": false
    },
    "html_url": "https://github.com/PedroHenriqueDevBR/adocao-animal-mobile",
    "description": "Aplicativo que consome dados do projeto adoção doguinho",
    "fork": false,
    "url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile",
    "forks_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/forks",
    "keys_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/keys{/key_id}",
    "collaborators_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/collaborators{/collaborator}",
    "teams_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/teams",
    "hooks_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/hooks",
    "issue_events_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/issues/events{/number}",
    "events_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/events",
    "assignees_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/assignees{/user}",
    "branches_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/branches{/branch}",
    "tags_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/tags",
    "blobs_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/git/blobs{/sha}",
    "git_tags_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/git/tags{/sha}",
    "git_refs_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/git/refs{/sha}",
    "trees_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/git/trees{/sha}",
    "statuses_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/statuses/{sha}",
    "languages_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/languages",
    "stargazers_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/stargazers",
    "contributors_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/contributors",
    "subscribers_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/subscribers",
    "subscription_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/subscription",
    "commits_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/commits{/sha}",
    "git_commits_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/git/commits{/sha}",
    "comments_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/comments{/number}",
    "issue_comment_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/issues/comments{/number}",
    "contents_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/contents/{+path}",
    "compare_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/compare/{base}...{head}",
    "merges_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/merges",
    "archive_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/{archive_format}{/ref}",
    "downloads_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/downloads",
    "issues_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/issues{/number}",
    "pulls_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/pulls{/number}",
    "milestones_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/milestones{/number}",
    "notifications_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/notifications{?since,all,participating}",
    "labels_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/labels{/name}",
    "releases_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/releases{/id}",
    "deployments_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-mobile/deployments",
    "created_at": "2022-03-26T00:01:33Z",
    "updated_at": "2022-05-16T15:52:47Z",
    "pushed_at": "2022-05-19T02:00:34Z",
    "git_url": "git://github.com/PedroHenriqueDevBR/adocao-animal-mobile.git",
    "ssh_url": "git@github.com:PedroHenriqueDevBR/adocao-animal-mobile.git",
    "clone_url":
        "https://github.com/PedroHenriqueDevBR/adocao-animal-mobile.git",
    "svn_url": "https://github.com/PedroHenriqueDevBR/adocao-animal-mobile",
    "homepage": null,
    "size": 1778,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": "Dart",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "forks_count": 0,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 0,
    "license": null,
    "allow_forking": true,
    "is_template": false,
    "topics": [],
    "visibility": "public",
    "forks": 0,
    "open_issues": 0,
    "watchers": 0,
    "default_branch": "main"
  },
  {
    "id": 400910261,
    "node_id": "MDEwOlJlcG9zaXRvcnk0MDA5MTAyNjE=",
    "name": "adocao-animal-web",
    "full_name": "PedroHenriqueDevBR/adocao-animal-web",
    "private": false,
    "owner": {
      "login": "PedroHenriqueDevBR",
      "id": 36716898,
      "node_id": "MDQ6VXNlcjM2NzE2ODk4",
      "avatar_url": "https://avatars.githubusercontent.com/u/36716898?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/PedroHenriqueDevBR",
      "html_url": "https://github.com/PedroHenriqueDevBR",
      "followers_url":
          "https://api.github.com/users/PedroHenriqueDevBR/followers",
      "following_url":
          "https://api.github.com/users/PedroHenriqueDevBR/following{/other_user}",
      "gists_url":
          "https://api.github.com/users/PedroHenriqueDevBR/gists{/gist_id}",
      "starred_url":
          "https://api.github.com/users/PedroHenriqueDevBR/starred{/owner}{/repo}",
      "subscriptions_url":
          "https://api.github.com/users/PedroHenriqueDevBR/subscriptions",
      "organizations_url":
          "https://api.github.com/users/PedroHenriqueDevBR/orgs",
      "repos_url": "https://api.github.com/users/PedroHenriqueDevBR/repos",
      "events_url":
          "https://api.github.com/users/PedroHenriqueDevBR/events{/privacy}",
      "received_events_url":
          "https://api.github.com/users/PedroHenriqueDevBR/received_events",
      "type": "User",
      "site_admin": false
    },
    "html_url": "https://github.com/PedroHenriqueDevBR/adocao-animal-web",
    "description":
        "Projeto sendo desenvolvido para a disciplina de projeto integrador.",
    "fork": false,
    "url": "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web",
    "forks_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/forks",
    "keys_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/keys{/key_id}",
    "collaborators_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/collaborators{/collaborator}",
    "teams_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/teams",
    "hooks_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/hooks",
    "issue_events_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/issues/events{/number}",
    "events_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/events",
    "assignees_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/assignees{/user}",
    "branches_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/branches{/branch}",
    "tags_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/tags",
    "blobs_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/git/blobs{/sha}",
    "git_tags_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/git/tags{/sha}",
    "git_refs_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/git/refs{/sha}",
    "trees_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/git/trees{/sha}",
    "statuses_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/statuses/{sha}",
    "languages_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/languages",
    "stargazers_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/stargazers",
    "contributors_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/contributors",
    "subscribers_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/subscribers",
    "subscription_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/subscription",
    "commits_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/commits{/sha}",
    "git_commits_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/git/commits{/sha}",
    "comments_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/comments{/number}",
    "issue_comment_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/issues/comments{/number}",
    "contents_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/contents/{+path}",
    "compare_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/compare/{base}...{head}",
    "merges_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/merges",
    "archive_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/{archive_format}{/ref}",
    "downloads_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/downloads",
    "issues_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/issues{/number}",
    "pulls_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/pulls{/number}",
    "milestones_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/milestones{/number}",
    "notifications_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/notifications{?since,all,participating}",
    "labels_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/labels{/name}",
    "releases_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/releases{/id}",
    "deployments_url":
        "https://api.github.com/repos/PedroHenriqueDevBR/adocao-animal-web/deployments",
    "created_at": "2021-08-28T23:30:46Z",
    "updated_at": "2022-03-28T11:12:36Z",
    "pushed_at": "2022-05-10T16:35:55Z",
    "git_url": "git://github.com/PedroHenriqueDevBR/adocao-animal-web.git",
    "ssh_url": "git@github.com:PedroHenriqueDevBR/adocao-animal-web.git",
    "clone_url": "https://github.com/PedroHenriqueDevBR/adocao-animal-web.git",
    "svn_url": "https://github.com/PedroHenriqueDevBR/adocao-animal-web",
    "homepage": "",
    "size": 12268,
    "stargazers_count": 1,
    "watchers_count": 1,
    "language": "TypeScript",
    "has_issues": true,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "forks_count": 0,
    "mirror_url": null,
    "archived": false,
    "disabled": false,
    "open_issues_count": 0,
    "license": {
      "key": "mit",
      "name": "MIT License",
      "spdx_id": "MIT",
      "url": "https://api.github.com/licenses/mit",
      "node_id": "MDc6TGljZW5zZTEz"
    },
    "allow_forking": true,
    "is_template": false,
    "topics": ["angular", "dart", "django", "python", "typescript"],
    "visibility": "public",
    "forks": 0,
    "open_issues": 0,
    "watchers": 1,
    "default_branch": "main"
  },
];

final docsResponse = '''<h1 align="center">
    :bird: Banco de horas
</h1>
<p align="center">
    :clock10: Organize o banco de horas dos funcionários da sua empresa. <br>
    Utilização simples.
</p>

<hr>

## Apresentação em vídeo

<div style="display: flex;">
    <a href="https://youtu.be/a1n0TdW0jUQ">
        <img src="https://user-images.githubusercontent.com/36716898/87263069-5fd0a500-c492-11ea-8a7e-112e2f0e144f.png" alt="Assista ao vídeo de apresentação" width="45%">
    </a>
    <a href="https://youtu.be/q1l6VZWX94M">
        <img src="https://user-images.githubusercontent.com/36716898/87262581-d2d91c00-c490-11ea-8b41-729596e48c61.png" alt="Assista ao vídeo de apresentação do sistema" width="45%">
    </a>
</div>

## Screenshots de exemplo

**Todas as screenshots serão apresentadas no final desta documentação.**

![Captura de tela de 2020-01-22 21-05-01](https://user-images.githubusercontent.com/36716898/72945927-22e5ea00-3d5c-11ea-9352-57ea71867742.png)

![Captura de tela de 2020-01-22 21-06-32](https://user-images.githubusercontent.com/36716898/72945931-24171700-3d5c-11ea-95b6-7921f817c4c2.png)

![Captura de tela de 2020-01-22 21-08-01](https://user-images.githubusercontent.com/36716898/72945936-25484400-3d5c-11ea-8c51-bbe676c3f5c0.png)


## Descrição

**Este sistema busca facilitar o gerenciamento do banco de horas das empresas.**

Banco de horas é um acordo entre empregador e empregado que busca flexibilizar o horário de trabalho do empregado em troca de compensação futura.

O Sistema Banco de Horas busca facilitar o gerenciamento das horas trabalhadas pelos funcionários de uma empresa, por meio de um sistema simples de ser utilizado, aliado à centralização dos dados armazenados em um único local, facilitando o gerenciamento das horas trabalhadas pelo setor pessoal.

## Desenvolvimento

O sistema foi desenvolvido utilizando a linguagem de programação Python junto ao framework Django.

![Python](https://blog.fazedores.com/wp-content/uploads/2014/12/python-logo-master-v3-TM.png)

![Django](https://cdn.iconscout.com/icon/free/png-512/django-2-282855.png)

### Modelagem

A modelagem consiste no gerenciemento de 7 (sete) entidades, são elas:
 - Setor
 - Perfil
 - Status
 - Forma de pagamento
 - Movimentação
 - Log da movimentação
 - Hash

A seguir a modelagem em uma linguagemn visual.

![BancoDeHoras](https://user-images.githubusercontent.com/36716898/72946725-91c44280-3d5e-11ea-9d1b-b32ecdc18e05.png)

## Aplicações do projeto

O projeto está dividido em 4 aplicações, cada uma com responsabilidades bem definidas, as aplicações do projeto são:

1. core
2. usuaário
3. movimentação
4. relatório

## Descricao das aplicações

### Core
Aplicação que serve como o núcleo do projeto, é por onde o usuário começa a utilizar a plicação, a aplicação **core** guarda a regra de negócio do projeto, toda a modelagem do projeto está centralizada nesta aplicação.

### usuario
O controle de acesso ao sistema fica na responsabilidade da aplicação **usuario**, todas as funcionalidades que são cadastro de usuário, login, logout, modificação no perfil, ou ativação e inativação fica na responsabilidade da aplicação **usuario**.

### movimentacao
Aplicação responsável por gerenciar as movimentações dos usuários se referindo principalmente à modificação da quantidade de horas de um determinado usuário.

### Relatório
Aplicação responsável por gerar relatórios de acordo com a solicitação do usuário.


### Front-end

O front-end da aplicação foi desenvolvido utilizando o Bootstrap framework, porém grande parte do código fonte do bootstrap foi modificado para o padrão definido no projeto.

![bootstrap](https://seeklogo.net/wp-content/uploads/2016/06/bootstrap-logo-vector-download.jpg)



## todas as screenshots

![Captura de tela de 2020-01-22 21-05-01](https://user-images.githubusercontent.com/36716898/72945927-22e5ea00-3d5c-11ea-9352-57ea71867742.png)

![Captura de tela de 2020-01-22 21-05-15](https://user-images.githubusercontent.com/36716898/72945928-237e8080-3d5c-11ea-9324-99636976d838.png)

![Captura de tela de 2020-01-22 21-05-24](https://user-images.githubusercontent.com/36716898/72945929-237e8080-3d5c-11ea-842e-869f79faf181.png)

![Captura de tela de 2020-01-22 21-06-22](https://user-images.githubusercontent.com/36716898/72945930-237e8080-3d5c-11ea-96f6-4c470a5f8741.png)

![Captura de tela de 2020-01-22 21-06-32](https://user-images.githubusercontent.com/36716898/72945931-24171700-3d5c-11ea-95b6-7921f817c4c2.png)

![Captura de tela de 2020-01-22 21-06-39](https://user-images.githubusercontent.com/36716898/72945932-24171700-3d5c-11ea-8fde-4a029903f3ee.png)

![Captura de tela de 2020-01-22 21-06-51](https://user-images.githubusercontent.com/36716898/72945933-24171700-3d5c-11ea-97a7-4e56740fddba.png)

![Captura de tela de 2020-01-22 21-06-54](https://user-images.githubusercontent.com/36716898/72945934-24afad80-3d5c-11ea-9b97-98fd260892f9.png)

![Captura de tela de 2020-01-22 21-07-02](https://user-images.githubusercontent.com/36716898/72945935-24afad80-3d5c-11ea-9674-8df32e92c88c.png)

![Captura de tela de 2020-01-22 21-08-01](https://user-images.githubusercontent.com/36716898/72945936-25484400-3d5c-11ea-8c51-bbe676c3f5c0.png)

![Captura de tela de 2020-01-22 21-08-20](https://user-images.githubusercontent.com/36716898/72945937-25484400-3d5c-11ea-9075-4bedc086523f.png)

![Captura de tela de 2020-01-22 21-08-26](https://user-images.githubusercontent.com/36716898/72945938-25484400-3d5c-11ea-9072-7175456c0068.png)

![Captura de tela de 2020-01-22 21-08-39](https://user-images.githubusercontent.com/36716898/72945940-25e0da80-3d5c-11ea-8e95-f2ef6e764657.png)

![Captura de tela de 2020-01-22 21-08-44](https://user-images.githubusercontent.com/36716898/72945941-25e0da80-3d5c-11ea-9ba6-4f9993702c7f.png)

![Captura de tela de 2020-01-22 21-08-50](https://user-images.githubusercontent.com/36716898/72945944-25e0da80-3d5c-11ea-96d5-da8c0199e01d.png)
''';

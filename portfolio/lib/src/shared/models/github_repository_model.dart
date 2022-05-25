class GitHubRepositoryModel {
  int? id;
  String? name;
  String? fullName;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? languagesUrl;
  String? stargazersUrl;
  String? cloneUrl;
  String? language;
  int? forksCount;
  String? visibility;
  int? stargazersCount;
  List<String>? topics;
  int? forks;
  String? defaultBranch;

  GitHubRepositoryModel({
    this.id,
    this.name,
    this.fullName,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.languagesUrl,
    this.stargazersUrl,
    this.cloneUrl,
    this.language,
    this.forksCount,
    this.visibility,
    this.stargazersCount,
    this.topics,
    this.defaultBranch,
    this.forks,
  });

  GitHubRepositoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    url = json['url'];
    languagesUrl = json['languages_url'];
    stargazersUrl = json['stargazers_url'];
    cloneUrl = json['clone_url'];
    language = json['language'];
    forksCount = json['forks_count'];
    visibility = json['visibility'];
    defaultBranch = json['default_branch'];
    stargazersCount = json['stargazers_count'];
    topics = json['topics'].cast<String>();
    forks = json['forks'];
  }

  static List<GitHubRepositoryModel> fromJsonList(List<dynamic> list) {
    List<GitHubRepositoryModel> result = [];
    for (Map<String, dynamic> map in list) {
      result.add(GitHubRepositoryModel.fromJson(map));
    }
    return result;
  }
}

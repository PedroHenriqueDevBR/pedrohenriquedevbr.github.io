export default class GithubProject {
    language: string;
    name: string;
    description: string;
    htmlUrl: string;
    startCount: number;

    constructor(language: string, name: string, description: string, htmlUrl: string, startCount: number,) {
        this.language = language;
        this.name = name;
        this.description = description;
        this.htmlUrl = htmlUrl;
        this.startCount = startCount;
    }

    public static fromJson(json: Record<string, string>[]): GithubProject[] {
        const projects: GithubProject[] = []
        for (const repository of json) {
            projects.push(new GithubProject(
                repository.language,
                repository.name,
                repository.description,
                repository.html_url,
                Number(repository.stargazers_count),
            ));
        }
        return projects;
    }
}

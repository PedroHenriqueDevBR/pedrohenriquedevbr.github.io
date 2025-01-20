export default class GithubProject {
    language: string;
    name: string;
    description: string;

    constructor(language: string, name: string, description: string) {
        this.language = language;
        this.name = name;
        this.description = description;
    }
}

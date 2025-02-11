import GithubProject from '@/models/GithubProject';

export default class GithubRepository {

    private endpoints: Record<string, string> = {
        "repositories": "https://api.github.com/users/pedrohenriquedevbr/repos",
        "raw": "https://raw.githubusercontent.com/PedroHenriqueDevBR/##/master/README.md"
    };

    private fakeDelay(ms: number): Promise<void> {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    public async fetchProjects(): Promise<GithubProject[]> {
        const response = await fetch(this.endpoints.repositories);
        const repositories = await response.json();
        repositories.sort((a: Record<string, string>, b: Record<string, string>) => {
            if (a.stargazers_count < b.stargazers_count) {
                return 1;
            }
            if (a.stargazers_count > b.stargazers_count) {
                return -1;
            }
            return 0;
        });
        const projects = GithubProject.fromJson(repositories)
        return projects;
    }

    public async fetchRaw(repositoryName: string): Promise<string> {
        const url = this.endpoints.raw.replace('##', repositoryName);
        const response = await fetch(url);
        const rawData = await response.text();
        return rawData;
    }

}
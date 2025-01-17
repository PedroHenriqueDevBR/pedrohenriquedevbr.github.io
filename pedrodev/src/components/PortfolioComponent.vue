<script setup lang="ts">
import { ref } from 'vue';

const endpoints = {
  repos: "https://api.github.com/users/pedrohenriquedevbr/repos",
  raw:
    "https://raw.githubusercontent.com/PedroHenriqueDevBR/##/master/README.md"
};

const githubRepositories = ref([]);

async function getRespositoryes() {
  const response = await fetch(endpoints.repos);
  const repositories = await response.json();
  console.log(repositories[0])
  repositories.sort(function (a, b) {
    if (a.updated_at < b.updated_at) {
      return 1;
    }
    if (a.updated_at > b.updated_at) {
      return -1;
    }
    return 0;
  });
  githubRepositories.value.length = 0
  githubRepositories.value = repositories
}

getRespositoryes();

</script>

<template>
  <main>
    <!-- <h1>Portfolio</h1> -->

    <h2>Projetos Github</h2>
    <hr class="divider">

    <div id="github-card-deck">

      <div class="github-card" v-for="repository in githubRepositories">
        <p class="language">{{ repository.language }}</p>
        <h2 class="repo-name">{{ repository.name }}</h2>
        <p class="repo-description">{{ repository.description }}</p>
      </div>

    </div>
  </main>
</template>

<style scoped>
main {
  padding: 16px;
  width: 1200px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
}

main h2 {
  text-align: left;
}

#github-card-deck {
  width: 100%;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  margin-top: 16px;
}

.github-card {
  padding: 16px;
  border: 2px solid var(--color-background-soft);
  width: 300px;
  margin: 16px;
  border-radius: 4px;
}

.language {
  background-color: var(--primary-color);
  width: fit-content;
  padding: 4px 12px;
  border-radius: 4px;
  font-weight: 600;
  font-size: 0.7rem;
}

.repo-name {
  font-weight: 600;
  margin: 4px 0;
  word-wrap: break-word;
  white-space: pre-wrap;
  word-break: break-word;
}

.repo-description {
  font-weight: 300;
}
</style>

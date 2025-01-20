<script setup lang="ts">
import { ref } from 'vue';
import GithubRepository from '@/repositories/GithubRepository'
import GithubProjectDetails from '@/components/GithubProjectDetails.vue'
import type GithubProject from '@/models/GithubProject';

const repository = new GithubRepository();
const githubRepositories = ref<GithubProject[]>([]);
const repositoryDetails = ref<string>('');
const loading = ref(false);

async function getRespositoryes() {
  loading.value = true;
  const repositories = await repository.fetchProjects();
  githubRepositories.value.length = 0
  githubRepositories.value = repositories
  loading.value = false;
}

async function getRepositoryDetails(name: string) {
  repositoryDetails.value = '';
  const details = await repository.fetchRaw(name);
  repositoryDetails.value = details;
}

function closeRepositoryDetails() {
  repositoryDetails.value = '';
}

getRespositoryes();

</script>

<template>
  <main>
    <!-- <h1>Portfolio</h1> -->

    <h2>Projetos Github</h2>
    <hr class="divider">

    <div class="loading" v-if="loading">
      <font-awesome-icon :icon="['fas', 'spinner']" />
    </div>

    <div id="github">
      <div id="github-card-deck" v-if="!loading && !repositoryDetails">
        <div class="github-card" :key="repository.name" v-for="repository in githubRepositories"
          @click="getRepositoryDetails(repository.name)">
          <p class="language">{{ repository.language }}</p>
          <h2 class="repo-name">{{ repository.name }}</h2>
          <p class="repo-description">{{ repository.description }}</p>
        </div>
      </div>

      <div id="github-details" v-if="repositoryDetails">
        <div class="header">
          <h1>Detalhes do projeto</h1>
          <font-awesome-icon class="btn-close" @click="closeRepositoryDetails" :icon="['fas', 'xmark']" />
        </div>
        <GithubProjectDetails class="repository-details" :content="repositoryDetails" v-if="repositoryDetails" />
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

#github {
  display: flex;
  flex-direction: row;
  align-items: flex-start;
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
  cursor: pointer;
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

.btn-close {
  font-size: 1.5rem;
  cursor: pointer;
}

.repo-description {
  font-weight: 300;
}

#github-details {
  margin-top: 16px;
}

#github-details .header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: var(--color-background-soft);
  padding: 16px 32px;
  margin-bottom: 16px;
}


.loading {
  font-size: 3rem;
  animation: spin 1.5s linear infinite;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }

  to {
    transform: rotate(360deg);
  }
}
</style>

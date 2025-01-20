<script setup lang="ts">
import { ref } from 'vue';
import GithubRepository from '@/repositories/GithubRepository'
import type GithubProject from '@/models/GithubProject';

const repository = new GithubRepository();
const githubRepositories = ref<GithubProject[]>([]);
const loading = ref(false);

async function getRespositoryes() {
  loading.value = true;
  const repositories = await repository.fetchProjects();
  githubRepositories.value.length = 0
  githubRepositories.value = repositories
  loading.value = false;
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

    <div id="github-card-deck" v-if="!loading">
      <div class="github-card" :key="repository.name" v-for="repository in githubRepositories">
        <div class="card-header">
          <p class="language">{{ repository.language || 'Docs' }}</p>
          <span><font-awesome-icon :icon="['fas', 'star']" /> {{ repository.startCount
            }}</span>
        </div>
        <a target="_blank" :href="repository.htmlUrl">
          <h2 class="repo-name">
            {{ repository.name }}
          </h2>
        </a>
        <a target="_blank" :href="repository.htmlUrl">
          <p class="repo-description">
            {{ repository.description }}
          </p>
        </a>
      </div>
    </div>
  </main>
</template>

<style scoped>
main {
  padding: 16px;
  max-width: 1200px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
}

a {
  text-decoration: none;
}

main h2 {
  text-align: left;
}

#github-card-deck {
  width: 100%;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
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

.card-header {
  display: flex;
  justify-content: space-between;
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

@media only screen and (max-width: 700px) {
  .github-card {
    width: 100%;
    padding: 16px;
    border: 2px solid var(--color-background-soft);
    width: 100%;
    margin: 16px;
    border-radius: 4px;
    cursor: pointer;
  }

  .language {
    font-size: 0.6rem;
  }

  .repo-name {
    font-size: 1rem;
  }

  .repo-description {
    font-size: 0.9rem;
  }
}
</style>

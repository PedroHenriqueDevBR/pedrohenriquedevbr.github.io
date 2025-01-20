<script setup lang="ts">
import { marked } from 'marked';
import { ref } from 'vue';

const markdown = ref<string>('')
const props = defineProps<{ content: string }>()

async function formatMarkdown() {
    markdown.value = '';
    markdown.value = await marked(props.content)
}


formatMarkdown()
</script>

<template>
    <div v-html="markdown" class="markdown-content"></div>
</template>

<style scoped>
#github-details>div.markdown-content.repository-details>p>img {
    width: 100%;
}
</style>

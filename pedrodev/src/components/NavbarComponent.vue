<script setup lang="ts">
import { RouterLink } from 'vue-router'
</script>

<template>
    <header>
        <RouterLink class="remove-decoration" to="/">
            <h1 class="logo agbalumo">PedroCast</h1>
        </RouterLink>
        <nav>
            <RouterLink class="nav-item" to="/">Inicio</RouterLink>
            <RouterLink class="nav-item" to="/sobre">Sobre</RouterLink>
            <RouterLink class="nav-item" to="/experiencias">Experiencias</RouterLink>
            <RouterLink class="nav-item" to="/portfolio">Portfolio</RouterLink>
        </nav>
    </header>
</template>

<style scoped>
header {
    width: 80%;
    padding: 32px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin-left: auto;
    margin-right: auto;
}

.logo {
    color: var(--primary-color);
}

.nav-item {
    padding: 16px;
    color: var(--color-on-background);
    text-decoration: none;
    font-weight: 600;
    font-size: 1rem;
}

.remove-decoration {
    text-decoration: none;
}

@media only screen and (max-width: 1000px) {
    header {
        width: 100%;
        padding: 16px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .nav-item {
        padding: 8px;
        font-size: 0.8rem;
    }
}
</style>

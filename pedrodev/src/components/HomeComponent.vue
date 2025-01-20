<script setup lang="ts">
import { ref } from 'vue';
const showMail = ref(false);
const closeMailBox = ref(true);
const mailHasCopy = ref(false)

function toggleShowMail() {
    if (closeMailBox.value) { showMail.value = !showMail.value; mailHasCopy.value = false; }
    closeMailBox.value = true
}

function copyMail() {
    closeMailBox.value = false
    navigator.clipboard.writeText('pedro.henrique.particular@gmail.com');
    mailHasCopy.value = true
}
</script>

<template>

    <main>
        <div class="description">
            <h2>Oi, sou <span class="name">Pedro</span></h2>
            <p>Desenvolvedor de software pleno <br> Python | VueJS | TypeScript | Docker | PostgreSQL | Linux</p>
        </div>

        <div class="image-container">
            <img src="@/assets/images/pedro.png" alt="Pedro Henrique">
        </div>
    </main>

    <div class="social-container">
        <div class="social-item">
            <a target="_blank" href="https://github.com/PedroHenriqueDevBR/"><font-awesome-icon
                    :icon="['fab', 'github']" /></a>
        </div>
        <div class="social-item">
            <a target="_blank" href="https://www.linkedin.com/in/pedro-henrique-br/"><font-awesome-icon
                    :icon="['fab', 'linkedin']" /></a>
        </div>
        <div class="social-item" @click="toggleShowMail">
            <font-awesome-icon :icon="['far', 'envelope']" />
        </div>
    </div>

    <div class="mail-container" v-if="showMail" @click="toggleShowMail">
        <div class="mail-box">
            <div class="flex" @click="copyMail">
                <span>pedro.henrique.particular@gmail.com</span>
                <font-awesome-icon :icon="['far', 'copy']" />
            </div>
            <p v-if="mailHasCopy">E-mail copiado</p>

        </div>
    </div>

</template>

<style scoped>
main {
    display: flex;
    justify-content: center;
    height: calc(100vh - 112px) !important;
}

.description {
    width: 100%;
    padding: 128px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: center;
}

.description h2 {
    font-weight: 400;
    font-size: 3rem;
    text-align: right;
    margin: 16px 0;
}

.description p {
    font-weight: 400;
    font-size: 1.5rem;
    text-align: right;
}

.name {
    color: var(--primary-color);
    font-size: 4rem;
    font-weight: 500;
}

.btn-outline {
    padding: 16px 32px;
    background-color: transparent;
    border: 4px solid var(--primary-color);
    border-radius: 6px;
    font-weight: 600;
    color: var(--primary-color);
    margin-top: 32px;
    font-size: 1.5rem;
}

.image-container {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.image-container img {
    width: 100%;
    height: -webkit-fill-available;
    object-fit: cover;
    mix-blend-mode: luminosity;
}

.social {
    color: #fff;
}

.social-container {
    position: absolute;
    top: 20%;
    right: 30%;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.social-item {
    font-size: 1.8rem;
    margin: 8px;
}

.mail-container {
    z-index: 1000;
    width: 100vw;
    height: 100vh;
    position: absolute;
    top: 0;
    left: 0;
    background-color: #000000aa;
    display: flex;
    justify-content: center;
    align-items: center;
}

.mail-box {
    z-index: 1001;
    background-color: var(--color-background);
    padding: 16px;
    border-radius: 8px;
}

.mail-box .flex {
    font-weight: 500;
    font-size: 1.5rem;
    cursor: copy;
    display: flex;
    justify-content: space-around;
    align-items: center;
}

.mail-box .flex * {
    color: var(--primary-color);
}

.mail-box .flex span {
    margin-right: 8px;
    color: inherit;
}

.mail-box p {
    text-align: center;
}

@media only screen and (max-width: 700px) {
    main {
        flex-direction: column-reverse;
        width: 100%;
        height: fit-content;
        justify-content: flex-end;
    }

    .description {
        width: 100%;
        padding: 16px;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
        line-height: 0 !important;
    }

    .description h2 {
        font-weight: 400;
        font-size: 1.2rem;
        text-align: center;
        line-height: 0 !important;
    }

    .description p {
        font-weight: 400;
        font-size: 0.8rem;
        text-align: center;
        line-height: 1.3rem;
    }

    .name {
        color: var(--primary-color);
        font-size: 1.6rem;
        font-weight: 500;
        line-height: 0 !important;
    }

    .btn-outline {
        padding: 8px 16px;
        background-color: transparent;
        border: 2px solid var(--primary-color);
        border-radius: 6px;
        font-weight: 600;
        color: var(--primary-color);
        margin-top: 16px;
        font-size: 0.8rem;
    }

    .image-container {
        height: 60%;
    }

    .image-container img {
        object-fit: cover;
    }

    .social-container {
        top: 18%;
        left: 20%;
    }

    .social-item {
        font-size: 1.2rem;
        margin: 8px;
    }
}

@media only screen and (min-width: 701px) and (max-width: 1000px) {
    main {
        flex-direction: column-reverse;
        width: 100%;
        height: fit-content;
    }

    .description {
        width: 100%;
        padding: 16px;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
    }

    .description h2 {
        font-weight: 400;
        font-size: 1.2rem;
        text-align: center;
        line-height: 0;
    }

    .description p {
        font-weight: 400;
        font-size: 0.8rem;
        text-align: center;
        line-height: normal;
    }

    .name {
        color: var(--primary-color);
        font-size: 2rem;
        font-weight: 500;
    }

    .btn-outline {
        padding: 8px 16px;
        background-color: transparent;
        border: 2px solid var(--primary-color);
        border-radius: 6px;
        font-weight: 600;
        color: var(--primary-color);
        margin-top: 32px;
        font-size: 0.8rem;
    }

    .image-container {
        height: 60%;
    }

    .image-container img {
        object-fit: contain;
    }

    .social-container {
        top: 30%;
        left: 30%;
    }

    .social-item {
        font-size: 1.5rem;
        margin: 8px;
    }
}
</style>

<script setup lang="ts">
import { ref, watch, onMounted } from 'vue';
import { useI18n } from 'vue-i18n';

const isPortuguese = ref(false);
const { locale } = useI18n();

function toggleLanguage() {
    const newLanguage = isPortuguese.value ? 'pt' : 'en';
    localStorage.setItem('language', newLanguage);
    setLanguage(newLanguage);
};

function setLanguage(language: string) {
    locale.value = language;
};

onMounted(() => {
    const savedLanguage = localStorage.getItem('language') || 'en';
    isPortuguese.value = savedLanguage === 'pt';
    setLanguage(savedLanguage);
});

// Observa mudanças no `isPortuguese` para alternar idioma
watch(isPortuguese, toggleLanguage);


</script>

<template>
    <label>
        <img width="25px" class="bandeirinha" src="@/assets/images/eua.png" alt="eua">
        <input :class="{ 'pt-br-color': isPortuguese, 'eua-color': !isPortuguese }" type="checkbox"
            v-model="isPortuguese" @change="toggleLanguage" />
        <img width="25px" class="bandeirinha" src="@/assets/images/brasil.png" alt="brasil">
    </label>
</template>

<style scoped>
.bandeirinha {
    margin: 0 8px;
}

.pt-br-color {
    background-color: #009688;
}

.eua-color {
    background-color: #db2020;
}

label {
    display: flex;
    align-items: center;
    cursor: pointer;
}

input[type="checkbox"] {
    appearance: none;
    width: 40px;
    height: 20px;
    border-radius: 10px;
    position: relative;
    outline: none;
    cursor: pointer;
    transition: 0.3s;
    background: linear-gradient(to right, #f00, #00f);
}

input[type="checkbox"]:checked {
    background: linear-gradient(-45deg, rgba(34, 195, 44, 1) 0%, rgba(253, 160, 45, 1) 80%);
}

input[type="checkbox"]:before {
    content: '';
    position: absolute;
    width: 16px;
    height: 16px;
    background: white;
    border-radius: 50%;
    top: 2px;
    left: 2px;
    transition: 0.3s;
}

input[type="checkbox"]:checked:before {
    left: 22px;
}

@media only screen and (max-width: 600px) {
    label {
        margin-top: 8px;
    }

}
</style>

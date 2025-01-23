import './assets/main.css';

import { createApp } from 'vue';
import { createPinia } from 'pinia';
import { library, dom } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { fas } from '@fortawesome/free-solid-svg-icons';
import { fab } from '@fortawesome/free-brands-svg-icons';
import { far } from '@fortawesome/free-regular-svg-icons';
import { createI18n } from 'vue-i18n';
import pt from '@/locales/pt.json';
import en from '@/locales/en.json';

const i18n = createI18n({
    locale: "en",
    fallbackLocale: "en",
    messages: { pt, en }
})

library.add(fas, far, fab)
dom.watch();

import App from './App.vue'
import router from './router'

const app = createApp(App)
app.component("font-awesome-icon", FontAwesomeIcon)

app.use(createPinia())
app.use(router)
app.use(i18n)
app.provide('i18n', i18n)

app.mount('#app')

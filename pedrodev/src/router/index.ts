import { createRouter, createWebHistory } from 'vue-router'
// import HomeView from '../views/HomeView.vue'
import HomeComponent from '@/components/HomeComponent.vue'
import AboutComponent from '@/components/AboutComponent.vue'
import ExperienceComponent from '@/components/ExperienceComponent.vue'
import PortfolioComponent from '@/components/PortfolioComponent.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      children: [
        {
          path: '',
          component: HomeComponent
        },
        {
          path: 'sobre',
          component: AboutComponent
        },
        {
          path: 'experiencias',
          component: ExperienceComponent
        },
        {
          path: 'portfolio',
          component: PortfolioComponent
        },
      ],
    },
  ],
})

export default router

import Vue from 'vue'
import VueRouter from 'vue-router'
import { authGuard } from '../auth/authGuard';

import Home from '../views/Home.vue'
import External from '../views/External.vue';
import NotFound from '../views/NotFound.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  }, 
  {
    path: '/external',
    name: 'External',
    component: External,
    beforeEnter: authGuard
  }, {
    path :'*',
    name: 'NotFound',
    component:NotFound
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import External from '../views/External.vue';

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
    component: External
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

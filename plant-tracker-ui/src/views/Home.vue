<template>
  <div class="home">
    <the-header/>
    <main v-if="!$auth.loading">
      <plant-list v-if="$auth.isAuthenticated"/>
      <login-prompt v-if="!$auth.isAuthenticated"/>
    </main>
  </div>
</template>

<script>
import TheHeader from "@/components/TheHeader.vue";
import PlantList from "@/components/PlantList.vue";
import LoginPrompt from '../components/LoginPrompt.vue';

export default {
  name: 'Home',
  components: {
    TheHeader,
    PlantList,
    LoginPrompt,
  }
}
</script>

<style>
body {
  @apply bg-gray-900;
}
</style>
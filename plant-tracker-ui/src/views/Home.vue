<template>
  <div class="home">
    <the-header/>
    <main>
      <div class="container container-content" v-if="!$auth.loading">
        <button class="btn btn-primary m-2" v-if="!$auth.isAuthenticated" @click="login">Log in</button>
        <button class="btn btn-primary m-2" v-if="$auth.isAuthenticated" @click="logout">Log out</button>
      </div>
      <plant-list/>
    </main>
  </div>
</template>

<script>
import TheHeader from "@/components/TheHeader.vue";
import PlantList from "@/components/PlantList.vue";

export default {
  name: 'Home',
  components: {
    TheHeader,
    PlantList,
  },
  methods: {
    login() {
      this.$auth.loginWithRedirect();
    },
    logout() {
      this.$auth.logout({
        returnTo: window.location.origin
      });
    }
  }
}
</script>

<style>
body {
  @apply bg-gray-900;
}
</style>
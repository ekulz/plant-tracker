<template>
  <div class="header">
    <div class="flex flex-row">
      <img class="mr-4 self-center" :src="`${publicPath}logo.png`" alt="logo" width="40px">
      <h1 class="title">Plant Tracker</h1>
    </div>
    <div v-if="!$auth.loading">
      <button class="btn btn-primary" v-if="!$auth.isAuthenticated" @click="login">Sign in</button>
      <button class="btn btn-primary" v-if="$auth.isAuthenticated" @click="logout">Sign out</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "the-header",
  data () {
    return {
      publicPath: process.env.BASE_URL
    }
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
};
</script>

<style>
.header {
  @apply bg-gray-900;
  @apply w-full;
  @apply p-6;
  @apply mb-8;
  @apply border-gray-800;
  @apply shadow-2xl;
  @apply border-b-2;
  @apply flex;
  @apply flex-auto;
  @apply flex-row;
  @apply justify-between;
}

.title {
  @apply text-4xl;
  @apply text-gray-300;
}
</style>

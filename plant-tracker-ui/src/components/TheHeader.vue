<template>
  <div class="header relative">
    <h1 class="title">Plant Tracker</h1>
    <div v-if="!$auth.loading">
      <button class="btn btn-primary absolute right-6 top-6" v-if="!$auth.isAuthenticated" @click="login">Sign in</button>
      <button class="btn btn-primary absolute right-6 top-6" v-if="$auth.isAuthenticated" @click="logout">Sign out</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "the-header",
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
}

.title {
  @apply text-4xl;
  @apply text-gray-200;
  @apply text-center; 
}
</style>

<template>
  <div class="welcome-container">
    <img class="welcome-image" :src="`${publicPath}logo.png`" alt="logo" width="200px">
    <p class="welcome-text">Welcome! Please sign in or create an account to continue.</p>
  </div>
</template>

<script>
export default {
  name: "login-prompt",
  data () {
    return {
      publicPath: process.env.BASE_URL
    }
  }
};
</script>

<style>
.welcome-container {
  @apply text-center;
  @apply block;
}

.welcome-image {
  @apply mt-16;
  @apply inline;
}

.welcome-text {
  @apply text-lg;
  @apply text-gray-400;
  @apply italic;
  @apply mt-4;
}
</style>

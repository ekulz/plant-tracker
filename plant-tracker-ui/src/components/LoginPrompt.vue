<template>
  <p class="text">Welcome! Please login or create an account to get started.</p>
</template>

<script>
export default {
  name: "login-prompt",
};
</script>

<style>
.text {
  @apply text-lg;
  @apply text-gray-400;
  @apply text-center;
  @apply italic;
  @apply mt-12;
}
</style>

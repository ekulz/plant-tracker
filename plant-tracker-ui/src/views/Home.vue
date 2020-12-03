<template>
  <div class="home">
    <the-header/>
    <main>
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
  }
}
</script>

<style>
body {
  @apply bg-gray-900;
}
</style>
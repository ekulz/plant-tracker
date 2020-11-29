<template>
  <div id="app">
    <the-header></the-header>
    <main>
      <plant-list></plant-list>
    </main>
  </div>
</template>

<script>
import TheHeader from "./components/TheHeader.vue";
import PlantList from "./components/PlantList.vue";

export default {
  name: "App",
  components: {
    TheHeader,
    PlantList,
  },
};
</script>

<style>
body {
  @apply bg-gray-900;
}
</style>

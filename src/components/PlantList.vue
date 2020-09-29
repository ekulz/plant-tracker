<template>
  <div class="container container-content">
    <plant-list-item v-for="plant in plants" v-bind:plant="plant" v-bind:key="plant.id"></plant-list-item>
  </div>
</template>

<script>
import PlantListItem from "./PlantListItem.vue";

export default {
  name: "plant-list",
  props: {
    plants: Array,
  },
  components: {
    PlantListItem,
  },
};
</script>

<template>
  <div class="container-content">
    <p class="text" v-if="!plants && !error">Loading...</p>
    <p class="text" v-if="error">We were unable to fetch your plants. Please try again later.</p>
    <plant-list-item v-for="plant in plants" v-bind:plant="plant" v-bind:key="plant.id"></plant-list-item>
    <add-plant v-if="plants" v-on:update:plants="fetchPlants()"></add-plant>
  </div>
</template>

<script>
import PlantListItem from "./PlantListItem.vue";
import AddPlant from "./AddPlant.vue";
import axios from "axios";

export default {
  name: "plant-list",
  data() {
    return {
      plants: null,
      error: false,
    };
  },
  async mounted() {
    await this.fetchPlants();
  },
  methods: {
    async fetchPlants() {
      try {
        const token = await this.$auth.getTokenSilently()
        const resp = await axios.get("/api/plants", {
          headers: {
            Authorization: `Bearer ${token}`
          }
        });
        this.plants = resp.data;
      } catch {
        this.plants = null;
        this.error = true;
      }
    }
  },
  components: {
    PlantListItem,
    AddPlant,
  },
};
</script>

<style>
.text {
  @apply items-center;
  @apply text-lg;
  @apply text-gray-400;
  @apply italic;
  @apply mt-4;
}
</style>

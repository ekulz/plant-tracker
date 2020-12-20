<template>
  <div class="container-content">
    <plant-list-item v-for="plant in plants" v-bind:plant="plant" v-bind:key="plant.id"></plant-list-item>
    <add-plant v-on:update:plants="fetchPlants()"></add-plant>
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
      } catch(err) {
        this.plants = null;
      }
    }
  },
  components: {
    PlantListItem,
    AddPlant,
  },
};
</script>

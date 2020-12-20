<template>
  <div class="container-content">
    <plant-list-item v-for="plant in plants" v-bind:plant="plant" v-bind:key="plant.id"></plant-list-item>
    <add-plant v-on:update:plants="savePlant($event)"></add-plant>
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
    try {
      const token = await this.$auth.getTokenSilently()
      const resp = await axios.get("/api/plants", {
        headers: {
          Authorization: `Bearer ${token}`    // send the access token through the 'Authorization' header
        }
      });
      this.plants = resp.data;
    } catch(err) {
      this.plants = null;
    }
  },
  methods: {
    savePlant(newPlant) {
      let lastId = Math.max(...this.plants.map((plant) => plant.id));
      lastId = (lastId < 0) ? 0 : lastId;
      let plant = {
        id: ++lastId,
        name: newPlant.name,
        species: newPlant.species,
        logs: [],
        logEntry: "",
      };

      this.plants.push(plant);
    },
  },
  components: {
    PlantListItem,
    AddPlant,
  },
};
</script>

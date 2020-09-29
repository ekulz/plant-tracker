<template>
  <div class="container container-content">
    <plant-list-item v-for="plant in plants" v-bind:plant="plant" v-bind:key="plant.id"></plant-list-item>
    <add-plant v-on:update:plants="savePlant($event)"></add-plant>
  </div>
</template>

<script>
import PlantListItem from "./PlantListItem.vue";
import AddPlant from "./AddPlant.vue";

export default {
  name: "plant-list",
  data: function () {
    return {
      plants: [
        {
          id: 1,
          name: "Lily",
          species: "Peace Lily",
          logs: ["Fertilized 11/08", "Watered 12/08"],
          logEntry: "",
        },
      ],
    };
  },
  methods: {
    savePlant(newPlant) {
      let lastId = Math.max(...this.plants.map((plant) => plant.id));
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

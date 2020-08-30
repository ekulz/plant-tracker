<template>
  <div id="app">
    <the-header></the-header>
    <main>
      <plant-list v-bind:plants="plants"></plant-list>
      <add-plant v-on:update:plants="savePlant($event)"></add-plant>
    </main>
  </div>
</template>

<script>
import TheHeader from "./components/TheHeader.vue";
import PlantList from "./components/PlantList.vue";
import AddPlant from "./components/AddPlant.vue";

export default {
  name: "App",
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
    TheHeader,
    PlantList,
    AddPlant,
  },
};
</script>

<style>
body {
  @apply bg-gray-900;
}
</style>

<template>
  <div id="app">
    <main>
      <the-header></the-header>
      <plant-list v-bind:plants="plants"></plant-list>
      <div class="container mx-auto flex flex-col items-center">
        <div id="new-plant-container" class="flex flex-col w-3/5 mt-4 mb-4">
          <div
            id="new-plant-edit"
            class="bg-gray-800 text-gray-500 rounded-lg"
            v-if="newPlant.editing"
          >
            <div id="new-plant-edit-name" class="m-4 flex flex-row items-center">
              <div class="w-24">
                <label for="name-input" class="block text-gray-400 italic">Name</label>
              </div>
              <div class="w-full">
                <input
                  type="text"
                  id="name-input"
                  class="bg-gray-700 focus:outline-none focus:shadow-outline border border-gray-700 rounded-lg py-1 px-2 appearance-none leading-normal text-gray-300 w-full"
                  placeholder="e.g. Lily"
                  v-model="newPlant.name"
                />
              </div>
            </div>
            <div id="new-plant-edit-species" class="m-4 flex flex-row items-center">
              <div class="w-24">
                <label for="species-input" class="block text-gray-400 italic">Species</label>
              </div>
              <div class="w-full">
                <input
                  type="text"
                  id="species-input"
                  class="bg-gray-700 focus:outline-none focus:shadow-outline border border-gray-700 rounded-lg py-1 px-2 appearance-none leading-normal text-gray-300 w-full"
                  placeholder="e.g. Peace Lily"
                  v-model="newPlant.species"
                />
              </div>
            </div>
            <div id="new-plant-edit-save" class="m-4">
              <button
                id="new-plant-edit-save-btn"
                class="bg-gray-700 hover:bg-blue-800 text-white font-bold py-2 px-4 rounded-lg"
                v-on:click="savePlant()"
              >Save</button>
            </div>
          </div>
          <div id="new-plant-add">
            <button
              id="new-plant-add-btn"
              class="bg-gray-700 hover:bg-blue-800 text-white font-bold py-2 px-4 rounded-lg"
              v-if="!newPlant.editing"
              v-on:click="toggleEdit()"
            >Add plant</button>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import TheHeader from "./components/TheHeader.vue";
import PlantList from "./components/PlantList.vue";

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
      newPlant: {
        editing: false,
        name: "",
        species: "",
      },
    };
  },
  methods: {
    savePlant() {
      let lastId = Math.max(...this.plants.map((plant) => plant.id));
      let plant = {
        id: ++lastId,
        name: this.newPlant.name,
        species: this.newPlant.species,
        logs: [],
        logEntry: "",
      };
      this.plants.push(plant);
      this.newPlant.name = "";
      this.newPlant.species = "";
      this.toggleEdit();
    },
    toggleEdit() {
      this.newPlant.editing = !this.newPlant.editing;
    },
  },
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

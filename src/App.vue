<template>
  <div id="app">
    <main>
      <div class="container mx-auto flex flex-col items-center">
        <div
          id="plant"
          class="bg-gray-800 text-gray-500 w-3/5 rounded-lg mt-4"
          v-for="plant in plants"
          v-bind:key="plant.id"
        >
          <div id="name" class="text-4xl text-gray-400 italic m-4">{{ plant.name }}</div>
          <div id="species" class="text-xl m-4">{{ plant.species }}</div>
          <div id="logs" class="text-base text-gray-400 m-4">
            <ul class="list-disc list-inside">
              <li v-for="log in plant.logs" v-bind:key="log">{{ log }}</li>
            </ul>
          </div>
          <div id="add-log" class="flex justify-left m-4">
            <input
              type="text"
              id="new-log"
              class="bg-gray-700 focus:outline-none focus:shadow-outline border border-gray-700 rounded-lg w-1/2 py-1 px-2 appearance-none leading-normal text-gray-300"
              placeholder="e.g. Watered 01/12/20..."
              v-model="plant.logEntry"
            />
            <button
              id="save-log"
              class="bg-gray-700 hover:bg-blue-800 text-white font-bold py-2 px-4 rounded-lg ml-2"
              v-on:click="saveLog(plant.id)"
            >Save</button>
          </div>
        </div>
        <div id="new-plant-container" class="flex flex-col w-3/5 mt-4">
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
    saveLog(plantId) {
      let plant = this.plants.find((x) => x.id === plantId);
      if (plant.logEntry) plant.logs.push(plant.logEntry);
      plant.logEntry = "";
    },
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
};
</script>

<style>
body {
  @apply bg-gray-900;
}
</style>

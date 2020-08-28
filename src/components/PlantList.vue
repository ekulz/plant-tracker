<template>
  <div class="container mx-auto flex flex-col items-center">
    <div
      id="plant-container"
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
  </div>
</template>

<script>
export default {
  name: "plant-list",
  props: {
    plants: Array,
  },
  methods: {
    saveLog(plantId) {
      let plant = this.plants.find((x) => x.id === plantId);
      if (plant.logEntry) plant.logs.push(plant.logEntry);
      plant.logEntry = "";
    },
  },
};
</script>
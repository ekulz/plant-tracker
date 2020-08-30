<template>
  <div class="container container-content">
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
          class="input w-full"
          placeholder="e.g. Watered 01/12/20..."
          v-model="plant.logEntry"
        />
        <button id="save-log" class="btn ml-2 w-20" v-on:click="saveLog(plant.id)">Save</button>
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

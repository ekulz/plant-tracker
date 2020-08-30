<template>
  <div class="container container-content">
    <div class="card w-3/5" v-for="plant in plants" v-bind:key="plant.id">
      <div class="h1">{{ plant.name }}</div>
      <div class="h2">{{ plant.species }}</div>
      <div class="p">
        <ul class="list-disc list-inside">
          <li v-for="log in plant.logs" v-bind:key="log">{{ log }}</li>
        </ul>
      </div>
      <div class="flex m-4">
        <input
          type="text"
          class="input w-full"
          placeholder="e.g. Watered 01/12/20..."
          v-model="plant.logEntry"
        />
        <button class="btn ml-2" v-on:click="saveLog(plant.id)">Save</button>
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

<style>
.h1 {
  @apply text-4xl;
  @apply text-gray-400;
  @apply italic;
  @apply m-4;
}

.h2 {
  @apply text-xl;
  @apply text-gray-500;
  @apply m-4;
}

.p {
  @apply text-base;
  @apply text-gray-400;
  @apply m-4;
}
</style>
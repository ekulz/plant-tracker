<template>
  <div class="card w-3/5">
    <div class="h1">{{ plant.name }}</div>
    <div class="h2">{{ plant.species }}</div>
    <div class="list">
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
      <button class="btn ml-2" v-on:click="saveLog()">Save</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "plant-list-item",
  props: {
    plant: Object,
  },
  methods: {
    saveLog() {
      if (this.plant.logEntry) {
        this.plant.logs.push(this.plant.logEntry);
        this.plant.logEntry = "";
      }
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

.list {
  @apply text-base;
  @apply text-gray-400;
  @apply m-4;
}
</style>

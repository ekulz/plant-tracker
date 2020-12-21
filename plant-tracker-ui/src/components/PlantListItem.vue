<template>
  <div class="card">
    <div class="h1">{{ plant.name }}</div>
    <div class="h2">{{ plant.species }}</div>
    <div class="list">
      <ul class="list-disc list-inside">
        <li v-for="(log, index) in plant.logs" v-bind:key="index + log">{{ log }}</li>
      </ul>
      <plant-list-item-log-input v-on:update:log="saveLog($event)"></plant-list-item-log-input>
    </div>
  </div>
</template>

<script>
import PlantListItemLogInput from "./PlantListItemLogInput.vue";

export default {
  name: "plant-list-item",
  props: {
    plant: Object,
  },
  methods: {
    saveLog(log) {
      if (!this.plant.logs) {
        this.plant.logs = [];
      }

      this.plant.logs.push(log);
    },
  },
  components: {
    PlantListItemLogInput,
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

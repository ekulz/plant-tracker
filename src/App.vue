<template>
  <div id="app">
    <main class="flex justify-center">
      <div id="plant" class="bg-gray-800 text-gray-500 w-2/5 rounded-lg mt-4">
        <div id="name" class="text-4xl text-gray-400 italic m-4">
          Lily
        </div>
        <div id="species" class="text-xl m-4">Peace Lily</div>
        <div id="logs" class="text-base text-gray-400 m-4">
          <ul class="list-disc list-inside">
            <li v-for="log in logs" v-bind:key="log">
              {{ log }}
            </li>
          </ul>
        </div>
        <div id="add-log" class="flex justify-left m-4">
          <input
            type="text"
            id="new-log"
            class="bg-gray-700 focus:outline-none focus:shadow-outline border border-gray-700 rounded-lg w-1/3 py-1 px-2 appearance-none leading-normal text-gray-300"
            placeholder="e.g. Watered 01/12/20..."
            v-model="logEntry"
          />
          <button
            id="save-log"
            class="bg-gray-700 hover:bg-blue-800 text-white font-bold py-2 px-4 rounded-lg ml-2"
            v-on:click="saveLog"
          >
            Save
          </button>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
export default {
  name: "App",
  data: function() {
    return {
      logs: ["Fertilized 11/08", "Watered 12/08"],
      logEntry: "",
    };
  },
  methods: {
    saveLog() {
      if (this.logEntry) this.logs.push(this.logEntry);
    },
  },
};
</script>

<style>
body {
  @apply bg-gray-900;
}
</style>

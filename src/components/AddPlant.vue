<template>
  <div class="container mx-auto flex flex-col items-center">
    <div id="new-plant-container" class="flex flex-col w-3/5 mt-4 mb-4">
      <div id="new-plant-edit" class="bg-gray-800 text-gray-500 rounded-lg" v-if="newPlant.editing">
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
</template>

<script>
export default {
  name: "add-plant",
  data: function () {
    return {
      newPlant: {
        editing: false,
        name: "",
        species: "",
      },
    };
  },
  methods: {
    toggleEdit() {
      this.newPlant.editing = !this.newPlant.editing;
    },
    savePlant() {
      this.$emit("update:plants", this.newPlant);
      this.newPlant.name = "";
      this.newPlant.species = "";
      this.toggleEdit();
    },
  },
};
</script>
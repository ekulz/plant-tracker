<template>
  <div class="container container-content">
    <div class="bg-gray-800 text-gray-500 w-3/5 rounded-lg" v-if="newPlant.editing">
      <div class="m-4 flex flex-row items-center">
        <div class="w-24">
          <label for="name-input" class="block text-gray-400 italic">Name</label>
        </div>
        <div class="w-full">
          <input
            type="text"
            id="name-input"
            class="input"
            placeholder="e.g. Lily"
            v-model="newPlant.name"
          />
        </div>
      </div>
      <div class="m-4 flex flex-row items-center">
        <div class="w-24">
          <label for="species-input" class="block text-gray-400 italic">Species</label>
        </div>
        <div class="w-full">
          <input type="text" class="input" placeholder="e.g. Peace Lily" v-model="newPlant.species" />
        </div>
      </div>
      <div class="m-4">
        <button class="btn" v-on:click="savePlant()">Save</button>
        <button class="btn ml-2" v-on:click="toggleEdit()">Cancel</button>
      </div>
    </div>
    <div class="w-3/5">
      <button class="btn w-32" v-if="!newPlant.editing" v-on:click="toggleEdit()">Add plant</button>
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
      this.newPlant.name = "";
      this.newPlant.species = "";
    },
    savePlant() {
      this.$emit("update:plants", this.newPlant);
      this.toggleEdit();
    },
  },
};
</script>

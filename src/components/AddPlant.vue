<template>
  <div class="container container-content">
    <div class="card w-3/5" v-if="newPlant.editing">
      <add-plant-input
        input-label="Name"
        input-placeholder="e.g. Lily"
        input-id="name-input"
        v-model="newPlant.name"
      ></add-plant-input>
      <add-plant-input
        input-label="Species"
        input-placeholder="e.g. Peace Lily"
        input-id="species-input"
        v-model="newPlant.species"
      ></add-plant-input>
      <div class="m-4">
        <button class="btn" v-on:click="savePlant()">Save</button>
        <button class="btn ml-2" v-on:click="toggleEdit()">Cancel</button>
      </div>
    </div>
    <div class="w-3/5">
      <button class="btn" v-if="!newPlant.editing" v-on:click="toggleEdit()">Add plant</button>
    </div>
  </div>
</template>

<script>
import AddPlantInput from "./AddPlantInput.vue";

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
  components: {
    AddPlantInput,
  },
};
</script>

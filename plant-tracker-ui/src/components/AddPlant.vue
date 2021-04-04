<template>
  <div>
    <div class="card" v-if="editing">
      <form v-on:submit.prevent="savePlant()">
        <add-plant-input
          input-label="Name"
          input-placeholder="e.g. Lily"
          input-id="name-input"
          input-ref="nameInput"
          ref="nameInputWrapper"
          v-model="plant.name"
        ></add-plant-input>
        <add-plant-input
          input-label="Species"
          input-placeholder="e.g. Peace Lily"
          input-id="species-input"
          input-ref="speciesInput"
          v-model="plant.species"
        ></add-plant-input>
        <div class="m-4">
          <button class="btn btn-primary" type="submit">Save</button>
          <button class="btn btn-primary ml-2" v-on:click="toggleEdit()">Cancel</button>
        </div>
      </form>
    </div>
    <div>
      <button
        class="btn btn-primary m-2"
        v-if="!editing"
        v-on:click="toggleEdit()"
      >Add plant</button>
    </div>
  </div>
</template>

<script>
import AddPlantInput from "./AddPlantInput.vue";
import axios from "axios";

export default {
  name: "add-plant",
  data() {
    return {
      editing: false,
      error: false,
      plant: {
        name: null,
        species: null,
      },
    };
  },
  methods: {
    toggleEdit() {
      this.editing = !this.editing;
      this.error = false;
      this.plant.name = null;
      this.plant.species = null;
      if (this.editing) {
        this.$nextTick(() => this.$refs.nameInputWrapper.$refs.nameInput.focus());
      }
    },
    async savePlant() {
      try {
        const token = await this.$auth.getTokenSilently()
        await axios.post("/api/plants", this.plant, {
          headers: {
            Authorization: `Bearer ${token}`
          }
        });
        
        this.$emit("update:plants");
        this.toggleEdit();
      } catch {
        this.error = true;
      }
    },
  },
  components: {
    AddPlantInput,
  },
};
</script>

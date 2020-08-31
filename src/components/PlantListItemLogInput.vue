<template>
  <div class="ml-3 mt-2">
    <button
      class="btn btn-secondary"
      v-if="!this.isEditing"
      v-on:click="toggleEdit()"
    >
      Add item
    </button>
    <div class="w-full">
      <input
        type="text"
        class="input"
        placeholder="e.g. Watered 01/12/20.."
        v-if="this.isEditing"
        v-model="data"
      />
    </div>
    <div class="mt-2">
      <button
        class="btn btn-secondary"
        v-if="this.isEditing"
        v-on:click="updateLog()"
      >
        Add
      </button>
      <button
        class="btn btn-secondary ml-2"
        v-if="this.isEditing"
        v-on:click="toggleEdit()"
      >
        Cancel
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: "plant-list-item-log-input",
  data: function() {
    return {
      isEditing: false,
      data: "",
    };
  },
  methods: {
    toggleEdit() {
      this.isEditing = !this.isEditing;
    },
    updateLog() {
      if (this.data) {
        this.$emit("update:log", this.data);
        this.data = "";
      }
    },
  },
};
</script>

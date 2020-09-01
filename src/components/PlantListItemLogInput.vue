<template>
  <div class="ml-3 mt-2">
    <button class="btn btn-secondary" v-if="!this.isEditing" v-on:click="toggleEdit()">Add item</button>
    <form v-on:submit.prevent="updateLog()">
      <div class="w-full">
        <input
          type="text"
          class="input"
          placeholder="e.g. Watered 01/12/20.."
          v-if="this.isEditing"
          v-model="data"
          ref="logInput"
          required
        />
      </div>
      <div class="mt-2">
        <button class="btn btn-secondary" type="submit" v-if="this.isEditing">Add</button>
        <button
          class="btn btn-secondary ml-2"
          v-if="this.isEditing"
          v-on:click="toggleEdit()"
        >Cancel</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: "plant-list-item-log-input",
  data: function () {
    return {
      isEditing: false,
      data: "",
    };
  },
  methods: {
    toggleEdit() {
      this.isEditing = !this.isEditing;
      if (this.data) this.data = "";
      if (this.isEditing) this.$nextTick(() => this.$refs.logInput.focus());
    },
    updateLog() {
      if (this.data) {
        this.$emit("update:log", this.data);
        this.data = "";
        this.$refs.logInput.focus();
      }
    },
  },
};
</script>

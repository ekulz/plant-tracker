<template>
  <div class="flex flex-row items-center m-4">
    <div class="w-24">
      <label :for="inputId" class="block text-gray-400 italic">{{inputLabel}}</label>
    </div>
    <div class="w-full">
      <input
        :id="inputId"
        type="text"
        class="input"
        :placeholder="inputPlaceholder"
        v-bind:value="value"
        v-on:input="$emit('input', $event.target.value)"
        required
      />
    </div>
  </div>
</template>

<script>
export default {
  name: "add-plant-input",
  props: ["value", "input-label", "input-placeholder", "input-id"],
};
</script>

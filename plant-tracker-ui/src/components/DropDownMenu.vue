<template>
  <div class="relative inline-block text-left">
    <button @click="isOpen = !isOpen" class="btn btn-primary" id="options-menu">
      <svg
        width="20"
        fill="currentColor"
        height="20"
        class="text-gray-300"
        viewBox="0 0 1792 1792"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M1523 1339q-22-155-87.5-257.5t-184.5-118.5q-67 74-159.5 115.5t-195.5 41.5-195.5-41.5-159.5-115.5q-119 16-184.5 118.5t-87.5 257.5q106 150 271 237.5t356 87.5 356-87.5 271-237.5zm-243-699q0-159-112.5-271.5t-271.5-112.5-271.5 112.5-112.5 271.5 112.5 271.5 271.5 112.5 271.5-112.5 112.5-271.5zm512 256q0 182-71 347.5t-190.5 286-285.5 191.5-349 71q-182 0-348-71t-286-191-191-286-71-348 71-348 191-286 286-191 348-71 348 71 286 191 191 286 71 348z"
        ></path>
      </svg>
    </button>
    <div
      v-show="isOpen"
      class="card-content origin-top-right absolute right-0 mt-2 w-56"
    >
      <div
        class="py-1"
        role="menu"
        aria-orientation="vertical"
        aria-labelledby="options-menu"
      >
        <div
          class="block px-4 py-2 text-gray-500 flex flex-col"
          role="menuitem"
        >
          Logged in as <i>{{ $auth.user.name }}</i>
        </div>
        <button
          class="block btn btn-primary-invisible flex flex-col text-left w-full"
          role="menuitem"
          @click="logout"
        >
          Log out
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "drop-down-menu",
  data: () => ({
    isOpen: false,
  }),
  methods: {
    logout() {
      this.$auth.logout({
        returnTo: window.location.origin,
      });
    },
    closeDropdown(e) {
      if (!this.$el.contains(e.target)) this.isOpen = false;
    },
  },
  mounted() {
    document.addEventListener("click", this.closeDropdown);
  },
  beforeDestroy() {
    document.removeEventListener("click", this.closeDropdown);
  },
};
</script>

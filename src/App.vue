<template>
  <div id="app">
    <main>
      <div class="plant">
        <div class="title">Lily</div>
        <div class="notes">Peace Lily</div>
        <div class="schedule">
          <ul>
            <li v-for="schedule in schedules" v-bind:key="schedule">
              {{ schedule }}
            </li>
          </ul>
        </div>
        <div class="add-schedule">
          <input
            type="text"
            class="new-schedule"
            placeholder="Search..."
            v-model="entry"
          />
          <button class="save-schedule" v-on:click="saveSchedule">Save</button>
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
      schedules: ["Fertilized 11/08", "Watered 12/08"],
      entry: "",
    };
  },
  methods: {
    saveSchedule() {
      if (this.entry) this.schedules.push(this.entry);
    },
  },
};
</script>

<style>
body {
  background-color: #181a1b;
  color: #fff;
}

main {
  padding: 25px;
  margin-left: 20%;
  margin-right: 20%;
}

.plant {
  background-color: grey;
}

.plant .title {
  font-size: 32px;
  font-weight: 500;
  margin: 10px;
  padding-top: 10px;
}

.plant .notes {
  font-size: 20px;
  font-style: italic;
  margin: 5px;
}

.plant .add-schedule {
  margin: 5px;
  padding-bottom: 5px;
}
</style>

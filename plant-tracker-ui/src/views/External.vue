<template>
  <div class='external'>
    <button class="btn btn-primary" @click="callApi">Call</button>
    <p class="text-gray-400">{{ apiMessage }}</p>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'External',
  data: function() {
    return {
      apiMessage: ""
    };
  },
  methods: {
    async callApi() {
      const token = await this.$auth.getTokenSilently();
      const { data } = await axios.get("/api/external", {
        headers: {
          Authorization: `Bearer ${token}`    // send the access token through the 'Authorization' header
        }
      });

      this.apiMessage = data;
    }
  }
};
</script>

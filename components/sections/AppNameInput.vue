<template>
  <div
    id="app-name-input"
    class="flex justify-center items-center bg-gray-700 pt-10"
  >
    <input
      v-model="appName"
      class="appearance-none w-full px-5 py-3 border border-gray-300 text-base leading-6 rounded-md 
              text-gray-400 bg-white placeholder-gray-500 focus:outline-none focus:shadow-outline focus:border-blue-300 
              transition duration-150 ease-in-out max-w-lg"
      type="text"
      name="app-name"
      autocomplete="off"
      placeholder="my_awesome_app"
      @keyup="updateAppName"
      @focusin="clearAppName"
    />
  </div>
</template>

<script>
import eventBus from '@/eventBus.js'

export default {
  created() {
    eventBus.$emit('setInitialAppName', this.appName)
  },
  methods: {
    updateAppName() {
      eventBus.$emit('appNameUpdated', this.appName)
    },
    clearAppName() {
      this.appName = ''
      eventBus.$emit('appNameUpdated', this.appName)
    }
  },
  props: {
    appName: {
      type: String,
      default: ''
    }
  }
}
</script>

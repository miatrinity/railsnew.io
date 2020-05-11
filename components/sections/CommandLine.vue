<template>
  <div class="text-gray-200 max-w-4xl mt-10 mx-auto" id="rails-new-output">
    <pre class="text-left px-10">
      {{ fullCommandLine }}
      </pre
    >
  </div>
</template>

<script>
import eventBus from '@/eventBus.js'

export default {
  props: {
    appName: {
      type: String
    },
    guestFavoriteFlags: {
      type: Array
    }
  },
  computed: {
    fullCommandLine() {
      return `rails new ${this.appName} ${[...this.guestFavoriteFlags]
        .map((x) => x.itemName)
        .join(' ')}`
    }
  },
  created() {
    eventBus.$on('setInitialAppName', (appNameData) => {
      this.appName = appNameData
    })

    eventBus.$on('appNameUpdated', (appNameData) => {
      this.appName = appNameData
    })
  }
}
</script>

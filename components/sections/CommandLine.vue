<template>
  <div id="rails-new-output" class="text-gray-200 max-w-4xl mt-10 mx-auto">
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
      type: String,
      default: 'my_app'
    },
    guestFavoriteFlags: {
      type: Array,
      default() {
        return []
      }
    },
    starterFlags: {
      type: Array,
      default() {
        return []
      }
    },
    frameworkFlags: {
      type: Array,
      default() {
        return []
      }
    },
    emailFlags: {
      type: Array,
      default() {
        return []
      }
    },
    leFrontendFlags: {
      type: Array,
      default() {
        return []
      }
    },
    frontEndFrameworkFlags: {
      type: Array,
      default() {
        return []
      }
    },
    testingFlags: {
      type: Array,
      default() {
        return []
      }
    },
    databaseSelection: {
      type: Array,
      default() {
        return []
      }
    }
  },
  computed: {
    fullCommandLine() {
      return `rails new ${this.appName} ${this.selectedDatabase()} ${[
        ...this.guestFavoriteFlags,
        ...this.starterFlags,
        ...this.frameworkFlags,
        ...this.emailFlags,
        ...this.leFrontendFlags,
        ...this.testingFlags
      ]
        .filter((x) => x.checked)
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
  },
  methods: {
    selectedDatabase() {
      if (this.databaseSelection[0].cliName === 'sqlite3') {
        return ''
      } else {
        return `-d ${this.databaseSelection[0].cliName}`
      }
    }
  }
}
</script>

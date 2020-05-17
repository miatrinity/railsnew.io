<template>
  <div id="rails-new-output" class="text-gray-200 max-w-4xl mt-10 mx-auto">
    <pre id="rails-new-output-text" class="text-left px-10">
      {{ fullCommandLine }}
      </pre
    >
  </div>
</template>

<script>
export default {
  props: {
    appName: {
      type: String,
      default: ''
    },
    selectedDatabase: {
      type: String,
      default: 'SQLite'
    },
    selectedFrontendFramework: {
      type: String,
      default: ''
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
    frontendFrameworkSelection: {
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
      return `rails new ${
        this.appName
      } ${this.flagForSelectedDatabase()} ${this.flagForSelectedFrontendFramework()} ${[
        ...this.guestFavoriteFlags,
        ...this.starterFlags,
        ...this.frameworkFlags,
        ...this.emailFlags,
        ...this.leFrontendFlags,
        ...this.testingFlags
      ]
        .filter((x) => x.checked)
        .map((x) => x.itemName)
        .join(' ')}`.replace(/  +/g, ' ')
    }
  },
  //  created() {
  // eventBus.$on('setInitialAppName', (appNameData) => {
  //   this.appName = appNameData
  // })

  // eventBus.$on('appNameUpdated', (appNameData) => {
  //   this.appName = appNameData
  //   eventBus.$emit('appNameUpdated', this.appName)
  // })
  // },
  methods: {
    flagForSelectedDatabase() {
      if (this.selectedDatabase === 'SQLite') {
        return ''
      } else {
        const databaseItem = this.databaseSelection.find(
          (item) => item.itemName === this.selectedDatabase
        )
        return `-d ${databaseItem.cliName}`
      }
    },
    flagForSelectedFrontendFramework() {
      if (this.selectedFrontendFramework === '') return ''

      const frameworkItem = this.frontendFrameworkSelection.find(
        (item) => item.itemName === this.selectedFrontendFramework
      )

      return `--webpack=${frameworkItem.cliName}`
    }
  }
}
</script>

<template>
  <div
    id="rails-new-output-container"
    class="text-gray-200 max-w-4xl 
           mt-3 sm:mt-3 md:mt-5 lg:mt-6 xl:mt-8
           h-auto sm:h-auto md:h-40 lg:h-40 xl:h-40
           mx-auto
           flex items-center"
  >
    <pre
      id="rails-new-output-text"
      class="text-left 
            px-5 sm:px-5 md:px-8 lg:px-10 xl:px-12
            text-xs md:text-base lg:text-base xl:text-base
            break-normal"
    >
      {{ fullCommandLine }}
      </pre
    >
  </div>
</template>

<script>
export default {
  props: {
    apiMode: {
      type: Boolean,
      default: false
    },
    appName: {
      type: String,
      default: ''
    },
    selectedDatabase: {
      type: String,
      default: 'SQLite'
    },
    selectedJsFramework: {
      type: String,
      default: ''
    },
    selectedCssFramework: {
      type: String,
      default: ''
    },
    selectedTestingFramework: {
      type: String,
      default: ''
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
      } ${this.maybeApiMode()} ${this.flagForSelectedDatabase()} ${this.flagForSelectedRailsTemplate()} ${[
        ...this.guestFavoriteFlags,
        ...this.starterFlags,
        ...this.frameworkFlags,
        ...this.emailFlags,
        ...this.leFrontendFlags,
        ...this.testingFlags
      ]
        .filter((x) => !x.checked)
        .map((x) => x.cliName)
        .join(' ')}`.replace(/  +/g, ' ')
    }
  },
  methods: {
    maybeApiMode() {
      if (this.apiMode) {
        return '--api'
      } else {
        return ''
      }
    },
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
    flagForSelectedRailsTemplate() {
      if (
        this.selectedJsFramework === '' &&
        this.selectedCssFramework === '' &&
        this.selectedTestingFramework === 'Minitest'
      )
        return ''

      if (this.selectedTestingFramework === 'Minitest') {
        this.selectedTestingFramework = ''
      }

      // TEMPLATE COMBOS START
      const templateCombosToTemplateURL = {
        'Stimulus.js': 'https://www.railsbytes.com/script/V33s33',
        'Stimulus.js + Stimulus Reflex':
          'https://www.railsbytes.com/script/zr4s0Y',
        'TailwindCSS': 'https://www.railsbytes.com/script/X8BsGy',
        'Bootstrap': 'https://www.railsbytes.com/script/VMys5p',
        'RSpec': 'https://www.railsbytes.com/script/VD7sra',
        'Stimulus.js:TailwindCSS': 'https://www.railsbytes.com/script/zyvsbW',
        'Stimulus.js:Bootstrap': 'https://www.railsbytes.com/script/xjNsAn',
        'Stimulus.js + Stimulus Reflex:TailwindCSS':
          'https://www.railsbytes.com/script/z0gsd8',
        'Stimulus.js + Stimulus Reflex:Bootstrap':
          'https://www.railsbytes.com/script/XnJs52',
        'Stimulus.js:RSpec': 'https://www.railsbytes.com/script/XnJsb5',
        'Stimulus.js + Stimulus Reflex:RSpec':
          'https://www.railsbytes.com/script/VqqsAD',
        'TailwindCSS:RSpec': 'https://www.railsbytes.com/script/V4Ysjj',
        'Bootstrap:RSpec': 'https://www.railsbytes.com/script/Vwys0J',
        'Stimulus.js:TailwindCSS:RSpec':
          'https://www.railsbytes.com/script/Xo5s9m',
        'Stimulus.js:Bootstrap:RSpec':
          'https://www.railsbytes.com/script/VAjskW',
        'Stimulus.js + Stimulus Reflex:TailwindCSS:RSpec':
          'https://www.railsbytes.com/script/XE5s7O',
        'Stimulus.js + Stimulus Reflex:Bootstrap:RSpec':
          'https://www.railsbytes.com/script/zyvso6'
      }
      // TEMPLATE COMBOS END

      const selectedRailsBytes = [
        this.selectedJsFramework,
        this.selectedCssFramework,
        this.selectedTestingFramework
      ]
        .filter((a) => a !== '')
        .join(':')

      // console.log('>>' + selectedRailsBytes + '<<')

      const templateURL = templateCombosToTemplateURL[selectedRailsBytes]

      return `--template "${templateURL}"`
    }
  }
}
</script>

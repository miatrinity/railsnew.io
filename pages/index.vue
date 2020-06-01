<template>
  <div>
    <main-hero />
    <br />
    <app-name-input :app-name="appName" />
    <div
      id="rails-new-command-generator-holder"
      class="flex-col bg-gray-700 pt-3 z-50"
    >
      <!-- :frontend-framework-selection="frontendFrameworkSelection" -->
      <command-line
        :app-name="appName"
        :api-mode="apiMode"
        :selected-js-framework="selectedJsFramework"
        :selected-css-framework="selectedCssFramework"
        :selected-database="selectedDatabase"
        :selected-frontend-framework="selectedFrontendFramework"
        :database-selection="databaseSelection"
        :guest-favorite-flags="guestFavoriteFlags"
        :starter-flags="starterFlags"
        :framework-flags="frameworkFlags"
        :le-frontend-flags="leFrontendFlags"
        :email-flags="emailFlags"
        :testing-flags="testingFlags"
      />
      <command-line-buttons :verification-link="verificationLink" />
      <stimulus-verify
        v-show="
          verifyPanelOpen &&
            currentRailsBytesCombo(
              selectedJsFramework,
              selectedCssFramework
            ) === 'Stimulus.js@'
        "
      />
      <stimulus-reflex-verify
        v-show="
          verifyPanelOpen &&
            currentRailsBytesCombo(
              selectedJsFramework,
              selectedCssFramework
            ) === 'Stimulus.js + Stimulus Reflex@'
        "
      />
      <tailwind-verify
        v-show="
          verifyPanelOpen &&
            currentRailsBytesCombo(
              selectedJsFramework,
              selectedCssFramework
            ) === '@TailwindCSS'
        "
      />
      <bootstrap-verify
        v-show="
          verifyPanelOpen &&
            currentRailsBytesCombo(
              selectedJsFramework,
              selectedCssFramework
            ) === '@Bootstrap'
        "
      />
      <stimulus-tailwind-verify
        v-show="
          verifyPanelOpen &&
            currentRailsBytesCombo(
              selectedJsFramework,
              selectedCssFramework
            ) === 'Stimulus.js@TailwindCSS'
        "
      />
      <stimulus-bootstrap-verify
        v-show="
          verifyPanelOpen &&
            currentRailsBytesCombo(
              selectedJsFramework,
              selectedCssFramework
            ) === 'Stimulus.js@Bootstrap'
        "
      />
      <stimulus-reflex-tailwind-verify
        v-show="
          verifyPanelOpen &&
            currentRailsBytesCombo(
              selectedJsFramework,
              selectedCssFramework
            ) === 'Stimulus.js + Stimulus Reflex@TailwindCSS'
        "
      />
      <stimulus-reflex-bootstrap-verify
        v-show="
          verifyPanelOpen &&
            currentRailsBytesCombo(
              selectedJsFramework,
              selectedCssFramework
            ) === 'Stimulus.js + Stimulus Reflex@Bootstrap'
        "
      />
    </div>
    <br />
    <section-header title="Choose Your Base" />
    <choose-your-base
      :items="chooseYourBaseSelection"
      :selected-base="selectedBase"
    />
    <section-header title="Add Extra Ingredients (powered by railsbytes.com)" />
    <extra-ingredients-js-framework
      :items="extraIngredientsJsFrameworkSelection"
      :selected-js-framework="selectedJsFramework"
    />
    <br />
    <extra-ingredients-css-framework
      :items="extraIngredientsCssFrameworkSelection"
      :selected-css-framework="selectedCssFramework"
    />
    <br />
    <extra-ingredients-testing-framework
      :items="extraIngredientsTestingFrameworkSelection"
      :selected-testing-framework="selectedTestingFramework"
    />
    <section-header title="Customize A'la Carte" />
    <database-selector
      :items="databaseSelection"
      :selected-database="selectedDatabase"
    />
    <br />
    <guest-favorites :items="guestFavoriteFlags" />
    <br />
    <starters :items="starterFlags" />
    <br />
    <mains :items="frameworkFlags" />
    <br />
    <email :items="emailFlags" />
    <br />
    <le-frontend :items="leFrontendFlags" />
    <br />
    <!-- <frontend-framework-selector
      :items="frontendFrameworkSelection"
      :selected-frontend-framework="selectedFrontendFramework"
    />
    <br /> -->
    <testing :items="testingFlags" />
  </div>
</template>

<script>
import Vue from 'vue'
import eventBus from '@/eventBus.js'

import MainHero from '@/components/layout/MainHero'
import AppNameInput from '@/components/sections/AppNameInput'
import CommandLine from '@/components/sections/CommandLine'
import CommandLineButtons from '@/components/sections/CommandLineButtons'
import BootstrapVerify from '@/components/verify/BootstrapVerify'
import StimulusBootstrapVerify from '@/components/verify/StimulusBootstrapVerify'
import StimulusReflexBootstrapVerify from '@/components/verify/StimulusReflexBootstrapVerify'
import StimulusReflexTailwindVerify from '@/components/verify/StimulusReflexTailwindVerify'
import StimulusReflexVerify from '@/components/verify/StimulusReflexVerify'
import StimulusTailwindVerify from '@/components/verify/StimulusTailwindVerify'
import StimulusVerify from '@/components/verify/StimulusVerify'
import TailwindVerify from '@/components/verify/TailwindVerify'
import SectionHeader from '@/components/sections/SectionHeader'
import ExtraIngredientsJsFramework from '@/components/sections/ExtraIngredientsJsFramework'
import ExtraIngredientsCssFramework from '@/components/sections/ExtraIngredientsCssFramework'
import ExtraIngredientsTestingFramework from '@/components/sections/ExtraIngredientsTestingFramework'
import ChooseYourBase from '@/components/sections/ChooseYourBase'
import DatabaseSelector from '@/components/sections/DatabaseSelector'
import GuestFavorites from '@/components/sections/GuestFavorites'
import Starters from '@/components/sections/Starters'
import Mains from '@/components/sections/Mains'
import Email from '@/components/sections/Email'
import LeFrontend from '@/components/sections/LeFrontend'
// import FrontendFrameworkSelector from '@/components/sections/FrontendFrameworkSelector'
import Testing from '@/components/sections/Testing'

export default {
  components: {
    MainHero,
    AppNameInput,
    CommandLine,
    CommandLineButtons,
    BootstrapVerify,
    StimulusBootstrapVerify,
    StimulusReflexBootstrapVerify,
    StimulusReflexTailwindVerify,
    StimulusReflexVerify,
    StimulusTailwindVerify,
    StimulusVerify,
    TailwindVerify,
    SectionHeader,
    ExtraIngredientsJsFramework,
    ExtraIngredientsCssFramework,
    ExtraIngredientsTestingFramework,
    ChooseYourBase,
    DatabaseSelector,
    GuestFavorites,
    Starters,
    Mains,
    Email,
    LeFrontend,
    // FrontendFrameworkSelector,
    Testing
  },
  mounted() {
    eventBus.$on('appNameUpdated', (appNameData) => {
      this.appName = appNameData
    })

    eventBus.$on('verifyPanelOpened', () => {
      this.verifyPanelOpen = true
    })

    eventBus.$on('verifyPanelClosed', () => {
      this.verifyPanelOpen = false
    })

    eventBus.$on('checkboxUpdated', (itemName) => {
      ;[
        this.guestFavoriteFlags,
        this.starterFlags,
        this.frameworkFlags,
        this.emailFlags,
        this.leFrontendFlags,
        this.testingFlags
      ].forEach((section) => {
        const itemNames = section.map((item) => item.itemName)

        if (itemNames.includes(itemName)) {
          const itemIndex = section.findIndex(
            (item) => item.itemName === itemName
          )
          Vue.set(section[itemIndex], 'checked', !section[itemIndex].checked)
        }
      })
    })

    eventBus.$on('radioButtonUpdated', (itemName) => {
      ;[
        this.extraIngredientsJsFrameworkSelection,
        this.extraIngredientsCssFrameworkSelection,
        this.databaseSelection,
        // this.frontendFrameworkSelection,
        this.chooseYourBaseSelection
      ].forEach((section) => {
        this.verifyPanelOpen = false
        const itemNames = section.map((item) => item.itemName)

        if (itemNames.includes(itemName)) {
          if (section[0].group === 'extra-ingredients-js-framework') {
            this.selectedJsFramework = itemName
            if (itemName === '') {
              Vue.set(this.starterFlags[0], 'disabled', false)
              Vue.set(this.starterFlags[3], 'disabled', false)
              Vue.set(this.leFrontendFlags[1], 'disabled', false)
              Vue.set(this.leFrontendFlags[3], 'disabled', false)
              Vue.set(this.leFrontendFlags[4], 'disabled', false)
              Vue.set(this.frameworkFlags[3], 'disabled', false)
            } else {
              // do NOT --skip-gemfile
              this.setCheckboxState(this.starterFlags[0], true)
              // do NOT --skip-bundler
              this.setCheckboxState(this.starterFlags[3], true)
              // do NOT --skip-javascript - otherwise it clashes with the railsbyte stuff
              this.setCheckboxState(this.leFrontendFlags[1], true)
              // DO --skip-webpack-install - the railsbyte is already installing webpack
              this.setCheckboxState(this.leFrontendFlags[3], false)
              // do NOT --skip-yarn - otherwise it clashes with the railsbyte stuff
              this.setCheckboxState(this.leFrontendFlags[4], true)

              // do NOT --skip-action-cable if Stimulus Reflex is being used
              if (itemName.includes('Reflex')) {
                this.setCheckboxState(this.frameworkFlags[3], true)
              }
            }
            this.setVerificationLink(
              this.selectedJsFramework,
              this.selectedCssFramework
            )
          } else if (section[0].group === 'extra-ingredients-css-framework') {
            this.selectedCssFramework = itemName
            if (
              itemName.includes('Tailwind') ||
              itemName.includes('Bootstrap')
            ) {
              // do NOT --skip-javascript - otherwise it clashes with the railsbyte stuff
              Vue.set(this.leFrontendFlags[1], 'checked', true)
              // DO --skip-webpack-install - the railsbyte is already installing webpack
              Vue.set(this.leFrontendFlags[3], 'checked', false)
              // do NOT --skip-yarn - otherwise it clashes with the railsbyte stuff
              Vue.set(this.leFrontendFlags[4], 'checked', true)
            }
            this.setVerificationLink(
              this.selectedJsFramework,
              this.selectedCssFramework
            )
          } else if (section[0].group === 'choose-your-base') {
            this.selectedBase = itemName
            this.apiMode = false
            if (itemName === 'Omakase') {
              this.setUpOmakase()
            } else if (itemName === 'API Mode') {
              this.setUpOmakase()
              this.apiMode = true
            } else if (itemName === 'The Minimalist') {
              this.setUpTheMinimalist()
            } else if (itemName === 'The Early Days') {
              this.setUpTheEarlyDays()
            }
          } else if (section[0].group === 'database') {
            this.selectedDatabase = itemName
          } else if (section[0].group === 'frontend-framework') {
            Vue.set(this.starterFlags[0], 'checked', true)
            Vue.set(this.leFrontendFlags[1], 'checked', true)
            Vue.set(this.leFrontendFlags[3], 'checked', true)
            Vue.set(this.leFrontendFlags[4], 'checked', true)

            this.selectedFrontendFramework = itemName
          }
        }
      })
    })
  },
  methods: {
    setUpOmakase() {
      this.selectedDatabase = 'SQLite'
      this.selectedFrontendFramework = ''
      this.selectedJsFramework = ''
      this.selectedCssFramework = ''
      this.verifyPanelOpen = false
      this.verificationLink = ''

      Vue.set(this.guestFavoriteFlags[0], 'checked', true)
      Vue.set(this.guestFavoriteFlags[1], 'checked', true)
      Vue.set(this.guestFavoriteFlags[2], 'checked', true)
      Vue.set(this.starterFlags[0], 'checked', true)
      Vue.set(this.starterFlags[1], 'checked', true)
      Vue.set(this.starterFlags[2], 'checked', true)
      Vue.set(this.starterFlags[3], 'checked', true)
      Vue.set(this.starterFlags[4], 'checked', true)
      Vue.set(this.frameworkFlags[0], 'checked', true)
      Vue.set(this.frameworkFlags[1], 'checked', true)
      Vue.set(this.frameworkFlags[2], 'checked', true)
      Vue.set(this.frameworkFlags[3], 'checked', true)
      Vue.set(this.emailFlags[0], 'checked', true)
      Vue.set(this.emailFlags[1], 'checked', true)
      Vue.set(this.leFrontendFlags[0], 'checked', true)
      Vue.set(this.leFrontendFlags[1], 'checked', true)
      Vue.set(this.leFrontendFlags[2], 'checked', true)
      Vue.set(this.leFrontendFlags[3], 'checked', true)
      Vue.set(this.leFrontendFlags[4], 'checked', true)
      Vue.set(this.testingFlags[0], 'checked', true)
      Vue.set(this.testingFlags[1], 'checked', true)

      // re-enable "Disabled by railsbyte" checkboxes
      Vue.set(this.starterFlags[0], 'disabled', false)
      Vue.set(this.starterFlags[3], 'disabled', false)
      Vue.set(this.leFrontendFlags[1], 'disabled', false)
      Vue.set(this.leFrontendFlags[3], 'disabled', false)
      Vue.set(this.leFrontendFlags[4], 'disabled', false)
      Vue.set(this.frameworkFlags[3], 'disabled', false)
    },
    setUpTheMinimalist() {
      this.selectedDatabase = 'SQLite'
      this.selectedFrontendFramework = ''
      Vue.set(this.guestFavoriteFlags[0], 'checked', false)
      Vue.set(this.guestFavoriteFlags[1], 'checked', false)
      Vue.set(this.guestFavoriteFlags[2], 'checked', false)
      Vue.set(this.starterFlags[0], 'checked', false)
      Vue.set(this.starterFlags[1], 'checked', false)
      Vue.set(this.starterFlags[2], 'checked', false)
      Vue.set(this.starterFlags[3], 'checked', false)
      Vue.set(this.starterFlags[4], 'checked', false)
      Vue.set(this.frameworkFlags[0], 'checked', false)
      Vue.set(this.frameworkFlags[1], 'checked', true)
      Vue.set(this.frameworkFlags[2], 'checked', false)
      Vue.set(this.frameworkFlags[3], 'checked', false)
      Vue.set(this.emailFlags[0], 'checked', false)
      Vue.set(this.emailFlags[1], 'checked', false)
      Vue.set(this.leFrontendFlags[0], 'checked', false)
      Vue.set(this.leFrontendFlags[1], 'checked', false)
      Vue.set(this.leFrontendFlags[2], 'checked', false)
      Vue.set(this.leFrontendFlags[3], 'checked', false)
      Vue.set(this.leFrontendFlags[4], 'checked', false)
      Vue.set(this.testingFlags[0], 'checked', false)
      Vue.set(this.testingFlags[1], 'checked', false)
    },
    setUpTheEarlyDays() {
      this.selectedDatabase = 'SQLite'
      this.selectedFrontendFramework = ''
      Vue.set(this.guestFavoriteFlags[0], 'checked', false)
      Vue.set(this.guestFavoriteFlags[1], 'checked', false)
      Vue.set(this.guestFavoriteFlags[2], 'checked', false)
      Vue.set(this.starterFlags[0], 'checked', true)
      Vue.set(this.starterFlags[1], 'checked', true)
      Vue.set(this.starterFlags[2], 'checked', false)
      Vue.set(this.starterFlags[3], 'checked', true)
      Vue.set(this.starterFlags[4], 'checked', true)
      Vue.set(this.frameworkFlags[0], 'checked', false)
      Vue.set(this.frameworkFlags[1], 'checked', true)
      Vue.set(this.frameworkFlags[2], 'checked', false)
      Vue.set(this.frameworkFlags[3], 'checked', false)
      Vue.set(this.emailFlags[0], 'checked', true)
      Vue.set(this.emailFlags[1], 'checked', false)
      Vue.set(this.leFrontendFlags[0], 'checked', true)
      Vue.set(this.leFrontendFlags[1], 'checked', false)
      Vue.set(this.leFrontendFlags[2], 'checked', false)
      Vue.set(this.leFrontendFlags[3], 'checked', false)
      Vue.set(this.leFrontendFlags[4], 'checked', false)
      Vue.set(this.testingFlags[0], 'checked', true)
      Vue.set(this.testingFlags[1], 'checked', false)
    },
    setCheckboxState(field, checked) {
      Vue.set(field, 'checked', checked)
      Vue.set(field, 'disabled', true)
    },
    setVerificationLink(jsFramework, cssFramework) {
      const railsBytes = jsFramework + '@' + cssFramework
      const railsBytesToURL = {
        '@': '',
        'Stimulus.js@': '/stimulus-verify',
        'Stimulus.js + Stimulus Reflex@': '/stimulus-reflex-verify',
        '@TailwindCSS': '/tailwind-verify',
        '@Bootstrap': '/bootstrap-verify',
        'Stimulus.js@TailwindCSS': '/stimulus-tailwind-verify',
        'Stimulus.js@Bootstrap': '/stimulus-bootstrap-verify',
        'Stimulus.js + Stimulus Reflex@TailwindCSS':
          '/stimulus-reflex-tailwind-verify',
        'Stimulus.js + Stimulus Reflex@Bootstrap':
          '/stimulus-reflex-bootstrap-verify'
      }
      this.verificationLink = railsBytesToURL[railsBytes]
    },
    currentRailsBytesCombo(jsFramework, cssFramework) {
      return jsFramework + '@' + cssFramework
    }
  },
  head() {
    return {
      title:
        'railsnew.io - the simplest way to generate a new Rails app with (or without) all the bells and whistles',
      meta: [
        {
          hid: 'description',
          name: 'description',
          content: 'Home page description'
        }
      ]
    }
  },
  data: () => ({
    appName: 'my_awesome_app',
    selectedDatabase: 'SQLite',
    selectedBase: 'Omakase',
    selectedJsFramework: '',
    selectedCssFramework: '',
    selectedTestingFramework: 'Minitest',
    selectedFrontendFramework: '',
    verificationLink: '',
    verifyPanelOpen: false,
    apiMode: false,
    extraIngredientsJsFrameworkSelection: [
      {
        itemName: '',
        description: 'None',
        group: 'extra-ingredients-js-framework'
      },
      {
        itemName: 'Stimulus.js',
        description:
          'A modest JavaScript framework for the HTML you already have.',
        group: 'extra-ingredients-js-framework',
        logo: 'StimulusLogo'
      },
      {
        itemName: 'Stimulus.js + Stimulus Reflex',
        description: 'Craft modern, reactive web interfaces',
        group: 'extra-ingredients-js-framework',
        logo: 'StimulusReflexLogo'
      }
    ],
    extraIngredientsCssFrameworkSelection: [
      {
        itemName: '',
        description: 'None',
        group: 'extra-ingredients-css-framework'
      },
      {
        itemName: 'TailwindCSS',
        description:
          'A utility-first CSS framework for rapidly building custom designs',
        group: 'extra-ingredients-css-framework',
        logo: 'TailwindLogo'
      },
      {
        itemName: 'Bootstrap',
        description:
          'Quickly design and customize responsive mobile-first sites',
        group: 'extra-ingredients-css-framework',
        logo: 'BootstrapLogo'
      }
    ],
    extraIngredientsTestingFrameworkSelection: [
      {
        itemName: 'Minitest',
        description: 'The default testing framework',
        group: 'extra-ingredients-testing-framework'
      },
      {
        itemName: 'RSpec',
        description:
          'The non-default testing framework used by (almost) everyone',
        group: 'extra-ingredients-testing-framework'
      }
    ],
    chooseYourBaseSelection: [
      {
        itemName: 'Omakase',
        description: 'Omakase is fine, but... (customize below)',
        logo: 'OmakaseLogo',
        group: 'choose-your-base'
      },
      {
        itemName: 'API Mode',
        description: 'Doing the heavy lifting on the client side!',
        logo: 'ApiModeLogo',
        group: 'choose-your-base'
      },
      {
        itemName: 'The Early Days',
        description: 'Somewhere between the two, circa 2007',
        logo: 'TheEarlyDaysLogo',
        group: 'choose-your-base'
      },
      {
        itemName: 'The Minimalist',
        description: '--skip-everything',
        logo: 'MinimalistLogo',
        group: 'choose-your-base'
      }
    ],
    databaseSelection: [
      {
        itemName: 'SQLite',
        description:
          'The current default. Recommended by @librarycongress for archival!',
        logo: 'SqLiteLogo',
        cliName: 'sqlite3',
        group: 'database'
      },
      {
        itemName: 'Postgres',
        description:
          'The real default. No-brainer if you ever plan to leave development.',
        logo: 'PostgresLogo',
        cliName: 'postgresql',
        group: 'database'
      },
      {
        itemName: 'MySQL',
        description: "The original default. It's fine, but Postgres is finer!",
        logo: 'MysqlLogo',
        cliName: 'mysql',
        group: 'database'
      }
    ],
    guestFavoriteFlags: [
      {
        itemName: 'Add spring?',
        cliName: '--skip-spring',
        description: 'Rails application preloader',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Add listen?',
        cliName: '--skip-listen',
        description:
          'Listens to file modifications and notifies you about the changes',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Add bootsnap?',
        cliName: '--skip-bootsnap',
        description: 'Boot large Ruby/Rails apps faster',
        checked: true,
        disabled: false
      }
    ],
    starterFlags: [
      {
        itemName: 'Create Gemfile?',
        cliName: '--skip-gemfile',
        description: 'Create/skip Gemfile',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Create .gitignore?',
        cliName: '--skip-git',
        description: 'Create/skip .gitignore file',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Create .keep files?',
        cliName: '--skip-keeps',
        description: 'Create/skip git .keep files in empty directories',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Run `bundle install`?',
        cliName: '--skip-bundle',
        description: "Run (or don't) `bundle install` after generating Gemfile",
        checked: true,
        disabled: false
      },
      {
        itemName:
          'Create Puma config files (skip if using a different app server)?',
        cliName: '--skip-puma',
        description: 'Skip Puma-related files',
        checked: true,
        disabled: false
      }
    ],
    frameworkFlags: [
      {
        itemName: 'Use ActionText?',
        cliName: '--skip-action-text',
        description: 'ActionText: Rich text content and editing',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Use ActiveRecord?',
        cliName: '--skip-active-record',
        description: 'ActiveRecord: The default ORM',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Use ActiveStorage?',
        cliName: '--skip-active-storage',
        description: 'ActiveStorage: attach files to your ActiveRecord models',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Use ActionCable?',
        cliName: '--skip-action-cable',
        description: 'ActionCable: The power of WebSockets, here and now!',
        checked: true,
        disabled: false
      }
    ],
    emailFlags: [
      {
        itemName: 'Use ActionMailer?',
        cliName: '--skip-action-mailer',
        description:
          'ActionMailer: Send emails from your application using mailer classes and views',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Use ActionMailbox?',
        cliName: '--skip-action-mailbox',
        description:
          'ActionMailbox: Routes incoming emails to controller-like mailboxes',
        checked: true,
        disabled: false
      }
    ],
    leFrontendFlags: [
      {
        itemName: 'Use Sprockets?',
        cliName: '--skip-sprockets',
        description: 'Sprockets: Rack-based asset packaging system',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Use Javascript?',
        cliName: '--skip-javascript',
        description:
          'Add/Skip JavaScript files and config (Webpacker/Turbolinks)',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Use Turbolinks?',
        cliName: '--skip-turbolinks',
        description: 'Turbolinks makes navigating your web application faster',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Use Webpacker?',
        cliName: '--skip-webpack-install',
        description: 'Sensible defaults for great OTB Webpack experience',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Use Yarn?',
        cliName: '--skip-yarn',
        description: 'Yarn: Fast, reliable, and secure dependency management',
        checked: true,
        disabled: false
      }
    ],
    testingFlags: [
      {
        itemName: 'Use Minitest?',
        cliName: '--skip-test',
        description: 'Add/Skip test files',
        checked: true,
        disabled: false
      },
      {
        itemName: 'Use System Tests?',
        cliName: '--skip-system-test',
        description: 'Add/Skip system test files',
        checked: true,
        disabled: false
      }
    ],
    versionSelector: [
      {
        itemName: '--edge',
        description:
          'Setup the application with Gemfile pointing to Rails repository',
        checked: true,
        disabled: false
      },
      {
        itemName: '6.0.3',
        description: 'Latest version of the Rails 6 series',
        checked: true,
        disabled: false
      },
      {
        itemName: '5.2.4.2',
        description: 'Latest version of the Rails 5 series',
        checked: true,
        disabled: false
      }
    ]
  })
}
</script>

<template>
  <div>
    <main-hero />
    <br />
    <div
      id="rails-new-command-generator-holder"
      class="flex-col bg-gray-700 py-10 z-50"
    >
      <app-name-input :app-name="appName" />
      <command-line
        :app-name="appName"
        :selected-js-framework="selectedJsFramework"
        :selected-css-framework="selectedCssFramework"
        :selected-database="selectedDatabase"
        :selected-frontend-framework="selectedFrontendFramework"
        :database-selection="databaseSelection"
        :frontend-framework-selection="frontendFrameworkSelection"
        :guest-favorite-flags="guestFavoriteFlags"
        :starter-flags="starterFlags"
        :framework-flags="frameworkFlags"
        :le-frontend-flags="leFrontendFlags"
        :email-flags="emailFlags"
        :testing-flags="testingFlags"
      />
      <command-line-buttons />
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
    <frontend-framework-selector
      :items="frontendFrameworkSelection"
      :selected-frontend-framework="selectedFrontendFramework"
    />
    <br />
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
import SectionHeader from '@/components/sections/SectionHeader'
import ExtraIngredientsJsFramework from '@/components/sections/ExtraIngredientsJsFramework'
import ExtraIngredientsCssFramework from '@/components/sections/ExtraIngredientsCssFramework'
import ChooseYourBase from '@/components/sections/ChooseYourBase'
import DatabaseSelector from '@/components/sections/DatabaseSelector'
import GuestFavorites from '@/components/sections/GuestFavorites'
import Starters from '@/components/sections/Starters'
import Mains from '@/components/sections/Mains'
import Email from '@/components/sections/Email'
import LeFrontend from '@/components/sections/LeFrontend'
import FrontendFrameworkSelector from '@/components/sections/FrontendFrameworkSelector'
import Testing from '@/components/sections/Testing'

export default {
  components: {
    MainHero,
    AppNameInput,
    CommandLine,
    CommandLineButtons,
    SectionHeader,
    ExtraIngredientsJsFramework,
    ExtraIngredientsCssFramework,
    ChooseYourBase,
    DatabaseSelector,
    GuestFavorites,
    Starters,
    Mains,
    Email,
    LeFrontend,
    FrontendFrameworkSelector,
    Testing
  },
  data: () => ({
    isOpen: false,
    appName: 'my_awesome_app',
    selectedDatabase: 'SQLite',
    selectedBase: 'The Minimalist',
    selectedJsFramework: '',
    selectedCssFramework: '',
    selectedFrontendFramework: '',
    extraIngredientsJsFrameworkSelection: [
      {
        itemName: 'Stimulus.js',
        group: 'extra-ingredients-js-framework'
      },
      {
        itemName: 'Stimulus.js + Stimulus Reflex',
        group: 'extra-ingredients-js-framework'
      }
    ],
    extraIngredientsCssFrameworkSelection: [
      {
        itemName: 'TailwindCSS',
        group: 'extra-ingredients-css-framework'
      },
      {
        itemName: 'Bootstrap',
        group: 'extra-ingredients-css-framework'
      }
    ],
    chooseYourBaseSelection: [
      {
        itemName: 'The Minimalist',
        description: '--skip-everything',
        logo: 'MinimalistLogo',
        group: 'choose-your-base'
      },
      {
        itemName: 'The Early Days',
        description: 'Somewhere between the two, circa 2007',
        logo: 'TheEarlyDaysLogo',
        group: 'choose-your-base'
      },
      {
        itemName: 'Omakase',
        description: 'Omakase is fine, but... (customize below)',
        logo: 'OmakaseLogo',
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
        itemName: '--skip-spring',
        description: 'Rails application preloader',
        checked: true
      },
      {
        itemName: '--skip-listen',
        description:
          'Listens to file modifications and notifies you about the changes',
        checked: true
      },
      {
        itemName: '--skip-bootsnap',
        description: 'Boot large Ruby/Rails apps faster',
        checked: true
      }
    ],
    starterFlags: [
      {
        itemName: '--skip-gemfile',
        description: "Don't create a Gemfile",
        checked: false
      },
      {
        itemName: '--skip-git',
        description: 'Skip .gitignore file',
        checked: true
      },
      {
        itemName: '--skip-keeps',
        description: 'Skip source control .keep files',
        checked: true
      },
      {
        itemName: '--skip-bundle',
        description: "Don't run bundle install",
        checked: false
      },
      {
        itemName: '--skip-puma',
        description: 'Skip Puma-related files',
        checked: false
      }
      // NOTE: add possibility to specify starter template
    ],
    frameworkFlags: [
      {
        itemName: '--skip-action-text',
        description: 'Skip Action Text gem',
        checked: true
      },
      {
        itemName: '--skip-active-record',
        description: 'Skip Active Record files',
        checked: false
      },
      {
        itemName: '--skip-active-storage',
        description: 'Skip Active Storage files',
        checked: true
      },
      {
        itemName: '--skip-action-cable',
        description: 'Skip Action Cable files',
        checked: true
      }
    ],
    emailFlags: [
      {
        itemName: '--skip-action-mailer',
        description:
          'Send emails from your application using mailer classes and views',
        checked: true
      },
      {
        itemName: '--skip-action-mailbox',
        description: 'Routes incoming emails to controller-like mailboxes',
        checked: true
      }
    ],
    leFrontendFlags: [
      {
        itemName: '--skip-sprockets',
        description: 'Skip Sprockets files',
        checked: true
      },
      {
        itemName: '--skip-javascript',
        description: 'Skip JavaScript files',
        checked: true
      },
      {
        itemName: '--skip-turbolinks',
        description: 'Skip turbolinks gem',
        checked: true
      },
      {
        itemName: '--skip-webpack-install',
        description: "Don't run Webpack install",
        checked: true
      }
    ],
    frontendFrameworkSelection: [
      {
        itemName: '',
        description: 'No frontend framework',
        logo: 'TODO',
        cliName: '',
        group: 'frontend-framework'
      },
      {
        itemName: 'Stimulus',
        description: 'stimulus yoo',
        logo: 'TODO',
        cliName: 'stimulus',
        group: 'frontend-framework'
      },
      {
        itemName: 'Vue.js',
        description: 'vue',
        logo: 'TODO',
        cliName: 'vue',
        group: 'frontend-framework'
      },
      {
        itemName: 'React',
        description: 'React',
        logo: 'TODO',
        cliName: 'react',
        group: 'frontend-framework'
      },
      {
        itemName: 'Elm',
        description: 'elm',
        logo: 'TODO',
        cliName: 'elm',
        group: 'frontend-framework'
      },
      {
        itemName: 'Angular',
        description: 'angular',
        logo: 'TODO',
        cliName: 'angular',
        group: 'frontend-framework'
      }
    ],
    testingFlags: [
      {
        itemName: '--skip-test',
        description: 'Skip test files',
        checked: true
      },
      {
        itemName: '--skip-system-test',
        description: 'Skip system test files',
        checked: true
      }
    ],
    versionSelector: [
      {
        itemName: '--edge',
        description:
          'Setup the application with Gemfile pointing to Rails repository',
        checked: true
      },
      {
        itemName: '6.0.3',
        description: 'Latest version of the Rails 6 series',
        checked: true
      },
      {
        itemName: '5.2.4.2',
        description: 'Latest version of the Rails 5 series',
        checked: true
      }
    ]
    // Generate engine
    // rails plugin new blorgh --mountable --full - what is full?
    // read: https://guides.rubyonrails.org/engines.html
    // probably --skip-namespace comes here?
    // It is highly recommended that the isolate_namespace line be left within the Engine class definition. Without it, classes generated in an engine may conflict with an application.
  }),
  methods: {
    setUpOmakase() {
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
      Vue.set(this.frameworkFlags[1], 'checked', false)
      Vue.set(this.frameworkFlags[2], 'checked', false)
      Vue.set(this.frameworkFlags[3], 'checked', false)
      Vue.set(this.emailFlags[0], 'checked', false)
      Vue.set(this.emailFlags[1], 'checked', false)
      Vue.set(this.leFrontendFlags[0], 'checked', false)
      Vue.set(this.leFrontendFlags[1], 'checked', false)
      Vue.set(this.leFrontendFlags[2], 'checked', false)
      Vue.set(this.leFrontendFlags[3], 'checked', false)
      Vue.set(this.testingFlags[0], 'checked', false)
      Vue.set(this.testingFlags[1], 'checked', false)
    },
    setUpTheMinimalist() {
      this.selectedDatabase = 'SQLite'
      this.selectedFrontendFramework = ''
      Vue.set(this.guestFavoriteFlags[0], 'checked', true)
      Vue.set(this.guestFavoriteFlags[1], 'checked', true)
      Vue.set(this.guestFavoriteFlags[2], 'checked', true)
      Vue.set(this.starterFlags[0], 'checked', true)
      Vue.set(this.starterFlags[1], 'checked', true)
      Vue.set(this.starterFlags[2], 'checked', true)
      Vue.set(this.starterFlags[3], 'checked', true)
      Vue.set(this.starterFlags[4], 'checked', false)
      Vue.set(this.frameworkFlags[0], 'checked', true)
      Vue.set(this.frameworkFlags[1], 'checked', false)
      Vue.set(this.frameworkFlags[2], 'checked', true)
      Vue.set(this.frameworkFlags[3], 'checked', true)
      Vue.set(this.emailFlags[0], 'checked', true)
      Vue.set(this.emailFlags[1], 'checked', true)
      Vue.set(this.leFrontendFlags[0], 'checked', true)
      Vue.set(this.leFrontendFlags[1], 'checked', true)
      Vue.set(this.leFrontendFlags[2], 'checked', true)
      Vue.set(this.leFrontendFlags[3], 'checked', true)
      Vue.set(this.testingFlags[0], 'checked', true)
      Vue.set(this.testingFlags[1], 'checked', true)
    },
    setUpTheEarlyDays() {
      this.selectedDatabase = 'SQLite'
      this.selectedFrontendFramework = ''
      Vue.set(this.guestFavoriteFlags[0], 'checked', true)
      Vue.set(this.guestFavoriteFlags[1], 'checked', true)
      Vue.set(this.guestFavoriteFlags[2], 'checked', true)
      Vue.set(this.starterFlags[0], 'checked', false)
      Vue.set(this.starterFlags[1], 'checked', false)
      Vue.set(this.starterFlags[2], 'checked', true)
      Vue.set(this.starterFlags[3], 'checked', false)
      Vue.set(this.starterFlags[4], 'checked', false)
      Vue.set(this.frameworkFlags[0], 'checked', true)
      Vue.set(this.frameworkFlags[1], 'checked', false)
      Vue.set(this.frameworkFlags[2], 'checked', true)
      Vue.set(this.frameworkFlags[3], 'checked', true)
      Vue.set(this.emailFlags[0], 'checked', false)
      Vue.set(this.emailFlags[1], 'checked', true)
      Vue.set(this.leFrontendFlags[0], 'checked', false)
      Vue.set(this.leFrontendFlags[1], 'checked', true)
      Vue.set(this.leFrontendFlags[2], 'checked', true)
      Vue.set(this.leFrontendFlags[3], 'checked', true)
      Vue.set(this.testingFlags[0], 'checked', false)
      Vue.set(this.testingFlags[1], 'checked', true)
    }
  },
  mounted() {
    eventBus.$on('showModal', () => {
      this.exampleModalShowing = true
    })

    eventBus.$on('appNameUpdated', (appNameData) => {
      this.appName = appNameData
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
        this.frontendFrameworkSelection,
        this.chooseYourBaseSelection
      ].forEach((section) => {
        const itemNames = section.map((item) => item.itemName)

        if (itemNames.includes(itemName)) {
          if (section[0].group === 'extra-ingredients-js-framework') {
            this.selectedJsFramework = itemName
            // do NOT --skip-gemfile
            Vue.set(this.starterFlags[0], 'checked', false)
            // do NOT --skip-bundler
            Vue.set(this.starterFlags[3], 'checked', false)
            // do NOT --skip-javascript - otherwise it clashes with the railsbyte stuff
            Vue.set(this.leFrontendFlags[1], 'checked', false)
            // DO --skip-webpack-install - the railsbyte is already installing webpack
            Vue.set(this.leFrontendFlags[3], 'checked', true)

            // do NOT --skip-action-cable if Stimulus Reflex is being used
            if (itemName.includes('Reflex')) {
              Vue.set(this.frameworkFlags[3], 'checked', false)
            }
          } else if (section[0].group === 'extra-ingredients-css-framework') {
            this.selectedCssFramework = itemName
            if (
              itemName.includes('Tailwind') ||
              itemName.includes('Bootstrap')
            ) {
              // do NOT --skip-javascript - otherwise it clashes with the railsbyte stuff
              Vue.set(this.leFrontendFlags[1], 'checked', false)
              // DO --skip-webpack-install - the railsbyte is already installing webpack
              Vue.set(this.leFrontendFlags[3], 'checked', true)
            }
          } else if (section[0].group === 'choose-your-base') {
            this.selectedBase = itemName
            if (itemName === 'Omakase') {
              this.setUpOmakase()
            } else if (itemName === 'The Minimalist') {
              this.setUpTheMinimalist()
            } else if (itemName === 'The Early Days') {
              this.setUpTheEarlyDays()
            }
          } else if (section[0].group === 'database') {
            this.selectedDatabase = itemName
          } else if (section[0].group === 'frontend-framework') {
            Vue.set(this.starterFlags[0], 'checked', false)
            Vue.set(this.leFrontendFlags[1], 'checked', false)
            Vue.set(this.leFrontendFlags[3], 'checked', false)

            this.selectedFrontendFramework = itemName
          }
        }
      })
    })
  }
}
</script>

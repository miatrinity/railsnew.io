<template>
  <div>
    <main-hero />
    <br />
    <div
      id="rails-new-command-generator-holder"
      class="flex-col bg-gray-700 py-10 z-50"
    >
      <app-name-input />
      <command-line
        :app-name="appName"
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
    </div>
    <br />
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
    <br />
    <page-footer />
    <br />
    <newsletter />
  </div>
</template>

<script>
import Vue from 'vue'
import eventBus from '@/eventBus.js'
import MainHero from '@/components/layout/MainHero'
import PageFooter from '@/components/layout/PageFooter'
import Newsletter from '@/components/layout/Newsletter'
import AppNameInput from '@/components/sections/AppNameInput'
import CommandLine from '@/components/sections/CommandLine'
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
    PageFooter,
    Newsletter,
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
    appName: 'clunky_ninja',
    selectedDatabase: 'SQLite',
    selectedFrontendFramework: '',
    setMenus: [
      {
        itemName: 'The Minimalist',
        description: '--skip-everything',
        checked: true
      },
      {
        itemName: 'The Early Days',
        description: 'Skip javascript, turbolinks, webpack',
        checked: false
      },
      {
        itemName: 'Omakase',
        description: 'Omakase is fine, but... (customize below)',
        checked: false
      }
    ],
    databaseSelection: [
      {
        itemName: 'SQLite',
        description:
          'The current default. Official recommendation from the @librarycongress for archival of datasets!',
        logo: 'SqLiteLogo',
        cliName: 'sqlite3',
        group: 'database'
      },
      {
        itemName: 'Postgres',
        description:
          'The real default. No-brainer if you ever plan to leave development',
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
        checked: true
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
        checked: true
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
        checked: true
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
      },
      {
        itemName: '--api',
        description: 'Just skip the whole frontend altogether!',
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
        itemName: 'Stimulus.js',
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
  mounted() {
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
      // this.selectedDatabase = itemName
      ;[this.databaseSelection, this.frontendFrameworkSelection].forEach(
        (section) => {
          const itemNames = section.map((item) => item.itemName)

          if (itemNames.includes(itemName)) {
            if (section[0].group === 'database') {
              this.selectedDatabase = itemName
            } else if (section[0].group === 'frontend-framework') {
              this.selectedFrontendFramework = itemName
            }
          }
        }
      )
    })
  }
}
</script>

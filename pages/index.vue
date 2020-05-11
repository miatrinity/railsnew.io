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
        :guest-favorite-flags="guestFavoriteFlags"
      />
    </div>
  </div>
</template>

<script>
import MainHero from '@/components/MainHero'
import AppNameInput from '@/components/sections/AppNameInput'
import CommandLine from '@/components/sections/CommandLine'

export default {
  components: {
    MainHero,
    AppNameInput,
    CommandLine
  },
  data: () => ({
    isOpen: false,
    appName: 'clunky_ninja',
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
    ]
  })
}
</script>

<template>
  <div id="app">
    <card-modal
      :showing="exampleModalShowing"
      @close="exampleModalShowing = false"
      @showModal="exampleModalShowing = true"
    >
      <h2 class="text-4xl font-bold text-gray-900">Not Implemented Yet :(</h2>
      <p class="mb-6 text-lg leading-loose">
        This featuere is coming in the public release. <br />
        You will be able to save a generated command line to "My Stuff" (top
        right corner). <br />
        You will be asked for a name (eg. "minimal postgres", "stimulus with
        postgres and rspec"). <br />
        For now this will store a cookie in your browser, with the name as the
        key and the command line as a value.<br />
        Upside: lightweight - no need to log in, add database support etc.<br />
        Downside: it will only live in the browser you saved from, you can
        loose<br />
        your cookies etc. If it will be a feature people are going to need (IF
        they are going to use the site in the first place :-), I might add
        support for FaunaDB or similar.
      </p>
      <button
        class="bg-blue-600 text-white px-4 py-2 text-sm uppercase tracking-wide font-bold rounded-lg"
        @click="exampleModalShowing = false"
      >
        Close
      </button>
    </card-modal>
    <desktop-navigation :mobile-menu-showing="mobileMenuShowing" />
    <mobile-navigation :mobile-menu-showing="mobileMenuShowing" />
    <nuxt />
    <newsletter />
    <page-footer />
  </div>
</template>

<script>
import eventBus from '@/eventBus.js'
import MobileNavigation from '@/components/organisms/MobileNavigation'
import DesktopNavigation from '@/components/organisms/DesktopNavigation'
import CardModal from '@/components/organisms/CardModal'
import Newsletter from '@/components/layout/Newsletter'
import PageFooter from '@/components/layout/PageFooter'

export default {
  components: {
    MobileNavigation,
    DesktopNavigation,
    PageFooter,
    Newsletter,
    CardModal
  },
  data() {
    return {
      exampleModalShowing: false,
      mobileMenuShowing: false
    }
  },
  mounted() {
    eventBus.$on('showModal', () => {
      this.exampleModalShowing = true
    })

    eventBus.$on('hamburgerMenuClosed', () => {
      this.mobileMenuShowing = false
    })

    eventBus.$on('hamburgerMenuOpened', () => {
      this.mobileMenuShowing = true
    })
  },
  methods: {
    myStuffComingSoon() {
      eventBus.$emit('showModal')
    }
  }
}
</script>

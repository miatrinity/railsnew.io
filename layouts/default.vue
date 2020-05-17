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
    <div class="max-w-screen-xl mx-auto px-4 sm:px-6">
      <nav
        class="relative flex items-center justify-between sm:h-10 md:justify-center"
      >
        <div
          class="flex items-center flex-1 md:absolute md:inset-y-0 md:left-0"
        >
          <div class="flex items-center justify-between w-full md:w-auto">
            <a href="#">
              <img
                class="h-8 w-auto sm:h-10"
                src="/img/logos/workflow-mark-on-white.svg"
                alt=""
              />
            </a>
            <div class="-mr-2 flex items-center md:hidden">
              <button
                type="button"
                class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out"
              >
                <svg
                  class="h-6 w-6"
                  stroke="currentColor"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M4 6h16M4 12h16M4 18h16"
                  />
                </svg>
              </button>
            </div>
          </div>
        </div>
        <div class="hidden md:block">
          <a
            href="/"
            class="font-medium text-gray-500 hover:text-gray-900 focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
            >🏠️ Home</a
          >
          <a
            href="why"
            class="ml-10 font-medium text-gray-500 hover:text-gray-900 focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
            >🤔 Why?</a
          >
          <a
            href="live-demo"
            class="ml-10 font-medium text-gray-500 hover:text-gray-900 focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
            >📽️ Live Demo</a
          >
          <a
            href="about"
            class="ml-10 font-medium text-gray-500 hover:text-gray-900  focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
            >📨 About / Contact</a
          >
          <a
            href="comingsoon"
            class="ml-10 font-medium bg-indigo-800 rounded-lg p-2 text-gray-100 shadow-lg hover:text-gray-900 focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
            >My Stuff</a
          >
        </div>
      </nav>
    </div>

    <!--
      Mobile menu, show/hide based on menu open state.

      Entering: "duration-150 ease-out"
        From: "opacity-0 scale-95"
        To: "opacity-100 scale-100"
      Leaving: "duration-100 ease-in"
        From: "opacity-100 scale-100"
        To: "opacity-0 scale-95"
    -->
    <div
      class="absolute top-0 inset-x-0 p-2 transition transform origin-top-right md:hidden"
      style="display: none;"
    >
      <div class="rounded-lg shadow-md">
        <div class="rounded-lg bg-white shadow-xs overflow-hidden">
          <div class="px-5 pt-4 flex items-center justify-between">
            <div>
              <img
                class="h-8 w-auto"
                src="/img/logos/workflow-mark-on-white.svg"
                alt=""
              />
            </div>
            <div class="-mr-2">
              <button
                type="button"
                class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out"
              >
                <svg
                  class="h-6 w-6"
                  stroke="currentColor"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M6 18L18 6M6 6l12 12"
                  />
                </svg>
              </button>
            </div>
          </div>
          <div class="px-2 pt-2 pb-3">
            <a
              href="#"
              class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out"
              >Product</a
            >
            <a
              href="#"
              class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out"
              >Features</a
            >
            <a
              href="#"
              class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out"
              >Marketplace</a
            >
            <a
              href="#"
              class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out"
              >Company</a
            >
          </div>
          <div>
            <a
              href="#"
              class="block w-full px-5 py-3 text-center font-medium text-indigo-600 bg-gray-50 hover:bg-gray-100 hover:text-indigo-700 focus:outline-none focus:bg-gray-100 focus:text-indigo-700 transition duration-150 ease-in-out"
            >
              Log in
            </a>
          </div>
        </div>
      </div>
    </div>
    <nuxt />
    <newsletter />
    <page-footer />
  </div>
</template>

<script>
import eventBus from '@/eventBus.js'
import CardModal from '@/components/organisms/CardModal'
import Newsletter from '@/components/layout/Newsletter'
import PageFooter from '@/components/layout/PageFooter'

export default {
  components: {
    PageFooter,
    Newsletter,
    CardModal
  },
  data() {
    return {
      exampleModalShowing: false
    }
  },
  mounted() {
    eventBus.$on('showModal', () => {
      this.exampleModalShowing = true
    })
  },
  methods: {
    myStuffComingSoon() {
      eventBus.$emit('showModal')
    }
  }
}
</script>

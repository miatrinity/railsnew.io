<template>
  <div class="max-w-screen-xl mx-auto px-4 sm:px-6">
    <nav
      class="relative flex items-center justify-between sm:h-10 md:justify-center"
    >
      <div class="flex items-center flex-1 md:absolute md:inset-y-0 md:left-0">
        <div class="flex items-center justify-end w-full md:w-auto">
          <div class="-mr-4 flex items-center md:hidden mt-3">
            <button
              type="button"
              class="inline-flex items-end justify-end p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out"
              @click="openHamburgerMenu"
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
        <n-link
          to="/"
          class="font-medium text-gray-500 hover:text-gray-900 focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
          >🏠️ Home</n-link
        >
        <n-link
          to="/why"
          class="ml-10 font-medium text-gray-500 hover:text-gray-900 focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
          >🤔 Why?</n-link
        >
        <n-link
          to="/live-demo"
          class="ml-10 font-medium text-gray-500 hover:text-gray-900 focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
          >📽️ Live Demo</n-link
        >
        <n-link
          to="/about"
          class="ml-10 font-medium text-gray-500 hover:text-gray-900  focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
          >📨 About / Contact</n-link
        >
        <a
          href="/comingsoon"
          target="_blank"
          class="ml-10 font-medium bg-indigo-800 rounded-lg p-2 text-gray-100 shadow-lg hover:text-gray-900 focus:outline-none focus:text-gray-900 transition duration-150 ease-in-out"
          >My Stuff</a
        >
      </div>
    </nav>
  </div>
</template>

<script>
import eventBus from '@/eventBus.js'

export default {
  props: {
    mobileMenuShowing: {
      type: Boolean
    }
  },
  methods: {
    openHamburgerMenu() {
      eventBus.$emit('hamburgerMenuOpened')
    }
  }
}
</script>

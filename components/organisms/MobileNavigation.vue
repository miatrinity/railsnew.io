<template>
  <div>
    <transition
      enter-active-class="transition ease-out duration-150 transform"
      enter-class="opacity-0 scale-95"
      enter-to-class="opacity-100 scale-100"
      leave-active-class="transition ease-in duration-100 transform"
      leave-class="opacity-100 scale-100"
      leave-to-class="opacity-0 scale-95"
    >
      <div
        v-show="mobileMenuShowing"
        class="absolute top-0 inset-x-0 p-2 transition transform origin-top-right md:hidden z-50"
      >
        <div class="rounded-lg shadow-md">
          <div class="rounded-lg bg-white shadow-xs overflow-hidden">
            <div class="px-5 pt-4">
              <div class="-mr-2">
                <button
                  type="button"
                  class="absolute top-0 right-0 m-2 p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out"
                  @click="closeHamburgerMenu"
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
              <n-link
                to="/"
                class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out"
                >🏠️ Home</n-link
              >
              <n-link
                to="/why"
                class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out"
                >🤔 Why?</n-link
              >
              <n-link
                to="/live-demo"
                class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out"
                >📽️ Live Demo</n-link
              >
              <n-link
                to="/about"
                class="mt-1 block px-3 py-2 
                       w-screen
                       rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50 focus:outline-none focus:text-gray-900 focus:bg-gray-50 transition duration-150 ease-in-out"
                >📨 About / Contact</n-link
              >
              <n-link
                to="/comingsoon"
                target="_blank"
                class="ml-0 sm:ml-0 md:ml-10
                       block
                       mt-2 sm:mt-2 md:mt-0 
                       font-medium bg-indigo-800 
                       rounded-none sm:rounded-none md:rounded-lg 
                       py-2 px-3 
                       text-gray-100 shadow-lg
                       hover:bg-indigo-200  hover:text-indigo-700 
                       focus:outline-none focus:text-gray-900 
                       transition duration-150 ease-in-out"
                >💻️ My Stuff</n-link
              >
            </div>
          </div>
        </div>
      </div>
    </transition>
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
  watch: {
    $route() {
      this.closeHamburgerMenu()
    }
  },
  methods: {
    closeHamburgerMenu() {
      eventBus.$emit('hamburgerMenuClosed')
    }
  }
}
</script>

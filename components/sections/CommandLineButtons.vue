<template>
  <div
    class="sm:flex-wrap md:flex lg:flex xl:flex 
           items-center
           justify-center 
           divide-y sm:divide-y-2 md:divide-y-0 lg:divide-y-0 xl:divide-y-0 
           divide-gray-400
           bg-gray-700 
           sm:pb-0 md:pb-8 lg:pb-8 xl:pb-8"
  >
    <a
      class="block bg-purple-500 
            lg:rounded-lg md:rounded-lg xl:rounded-lg 
            px-6 text-gray-100 shadow-2xl whitespace-no-wrap py-3"
      @click.stop.prevent="copyToClipboard"
    >
      Copy to Clipboard
    </a>

    <a
      v-show="verificationLink !== ''"
      class="block bg-indigo-800 
             lg:rounded-lg md:rounded-lg xl:rounded-lg 
             mx-0 md:mx-5
             px-6 text-gray-100 shadow-2xl whitespace-no-wrap py-3"
      :href="verificationLink"
      target="_blank"
    >
      Verify My Setup
    </a>

    <a
      class="block bg-indigo-800 
             md:rounded-lg lg:rounded-lg xl:rounded-lg 
             px-6 text-gray-100 shadow-2xl whitespace-no-wrap py-3"
      href="/comingsoon"
      target="_blank"
    >
      Save to My Stuff
    </a>
  </div>
</template>

<script>
import eventBus from '@/eventBus.js'

export default {
  props: {
    verificationLink: {
      type: String,
      default: ''
    }
  },
  methods: {
    copyToClipboard() {
      const tempInput = document.createElement('input')
      tempInput.setAttribute(
        'value',
        document.querySelector('#rails-new-output-text').innerHTML.trim()
      )
      document.body.appendChild(tempInput)
      tempInput.select()
      document.execCommand('copy')
      this.$toast.show('Copied to Clipboard!', {
        duration: 1500,
        fullWidth: true,
        className: 'copied-toast'
      })
      document.body.removeChild(tempInput)
    },
    myStuffComingSoon() {
      eventBus.$emit('showModal')
    }
  }
}
</script>

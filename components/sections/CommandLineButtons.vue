<template>
  <div class="flex justify-center">
    <button
      class="bg-purple-500 rounded-lg py-2 px-6 text-gray-100 shadow-2xl mx-10"
      @click.stop.prevent="copyToClipboard"
    >
      Copy to Clipboard
    </button>

    <a
      class="bg-indigo-800 rounded-lg py-2 px-6 text-gray-100 shadow-2xl mx-10"
      href="comingsoon"
    >
      Save to My Stuff
    </a>
  </div>
</template>

<script>
import eventBus from '@/eventBus.js'

export default {
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

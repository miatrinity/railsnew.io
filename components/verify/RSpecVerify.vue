<template>
  <div class="w-full bg-gray-200">
    <div class="max-w-3xl px-10 py-0 mx-auto pb-10">
      <div
        class="flex justify-between text-4xl font-semibold antialiased text-gray-700 mb-6 pt-6 tracking-tight leading-tight"
      >
        <h1>
          Verify your RSpec Setup
        </h1>
        <div
          class="hover:bg-gray-900 hover:text-gray-200 rounded-lg p-3 text-gray-500 text-3xl"
          @click="closeVerifyPanel"
        >
          X CLOSE
        </div>
      </div>
      <ol class="list-decimal leading-loose">
        <li>cd into the generated app</li>
        <li><pre>> rspec</pre></li>
        <li>
          You should see something like

          <pre>
            
No examples found.

Finished in 0.00022 seconds (files took 0.06779 seconds to load)
0 examples, 0 failures
          </pre>
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
import eventBus from '@/eventBus.js'

export default {
  methods: {
    closeVerifyPanel() {
      eventBus.$emit('verifyPanelClosed')
    }
  }
}
</script>

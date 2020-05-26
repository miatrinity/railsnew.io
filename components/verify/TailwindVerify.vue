<template>
  <div class="w-full bg-gray-200">
    <div class="max-w-3xl px-10 py-0 mx-auto pb-10">
      <div
        class="flex justify-between text-4xl font-semibold antialiased text-gray-700 mb-6 pt-6 tracking-tight leading-tight"
      >
        <h1>
          Verify your Tailwind Setup
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
        <li><pre>> rails g controller verify index</pre></li>
        <li>
          paste this into
          <span class="italic">app/views/verify/index.html.erb</span>:
          <div
            style="background: #272822; overflow:auto;width:auto;padding:.2em .6em;"
            class="px-5 my-5"
          >
            <pre
              style="margin: 0; line-height: 125%"
            ><span style="color: #f92672">&lt;h1</span> <span style="color: #a6e22e">class=</span><span style="color: #e6db74">&quot;text-red-500&quot;</span><span style="color: #f92672">&gt;</span><span style="color: #eee">Hello, Tailwind!</span><span style="color: #f92672">&lt;/h1&gt;</span>
</pre>
          </div>
        </li>
        <li>> <code>bin/webpack-dev-server</code></li>
        <li>> <code>bin/rails s -p 4242</code></li>
        <li>
          > <code>open http://localhost:4242/verify/index</code><br />
          (or simply visit
          <a
            href="http://localhost:4242/verify/index"
            class="underline text-indigo-800"
            >http://localhost:4242/verify/index</a
          >)
        </li>
        <li>
          Verify that the text 'Hello, Tailwind!' is rendered in red.
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

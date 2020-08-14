<template>
  <div class="w-full bg-gray-200">
    <div class="max-w-3xl px-10 py-0 mx-auto pb-10">
      <div
        class="flex justify-between text-4xl font-semibold antialiased text-gray-700 mb-6 pt-6 tracking-tight leading-tight"
      >
        <h1>
          Verify your Stimulus.js + Bootstrap + RSpec Setup
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
        <li><pre class="code">> rails g controller verify index</pre></li>

        <li>
          paste this into
          <span class="italic">app/views/verify/index.html.erb</span>:
          <div
            style="background: #272822; overflow:auto;width:auto;"
            class="px-5 my-5"
          >
            <pre style="margin: 0; line-height: 125%">      
<span style="color: #f92672">&lt;div</span> <span style="color: #a6e22e">data-controller=</span><span style="color: #e6db74">&quot;hello&quot;</span><span style="color: #f92672">&gt;</span>
<span style="color: #f92672">&lt;h1</span> <span style="color: #a6e22e">data-target=</span><span style="color: #e6db74">&quot;hello.output&quot;</span> <span style="color: #f92672">&gt;&lt;/h1&gt;</span>
<span style="color: #f92672">&lt;/div&gt;</span>
  </pre>
          </div>
        </li>

        <li>
          paste this into
          <span class="italic">app/views/verify/index.html.erb</span>:
          <div
            style="background: #272822; overflow:auto;width:auto;padding:.2em .6em;"
            class="px-5 my-5"
          >
            <pre
              style="margin: 0; line-height: 125%"
            ><span style="color: #f92672">&lt;h1</span> <span style="color: #a6e22e">class=</span><span style="color: #e6db74">&quot;text-danger&quot;</span><span style="color: #f92672">&gt;</span><span style="color: #eee">Hello, Bootstrap!</span><span style="color: #f92672">&lt;/h1&gt;</span>
</pre>
          </div>
        </li>

        <li><pre class="code">> bin/webpack-dev-server</pre></li>
        <li><pre class="code">> bin/rails s -p 4242</pre></li>
        <li>
          <pre class="code">> open http://localhost:4242/verify/index</pre>
          (or simply visit
          <a
            href="http://localhost:4242/verify/index"
            class="underline text-indigo-800"
            >http://localhost:4242/verify/index</a
          >)
        </li>

        <li>
          To <strong>verify Stimulus</strong>: the index page should display
          'Hello, Stimulus!'.
        </li>

        <li>
          To <strong>verify Bootstrap</strong>: the index page should display
          'Hello, Bootstrap!' rendered in red.
        </li>

        <li>
          To <strong>verify RSpec</strong>: type this into your console:
          <pre class="code">> rspec</pre>

          You should see something like:
          <pre class="code">
No examples found.

Finished in 0.00022 seconds (files took 0.06779 seconds to load)
0 examples, 0 failures            
  </pre
          >
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

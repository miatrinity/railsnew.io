<template>
  <div class="w-full bg-gray-200">
    <div class="max-w-3xl px-10 py-0 mx-auto pb-10">
      <div
        class="flex justify-between text-4xl font-semibold antialiased text-gray-700 mb-6 pt-6 tracking-tight leading-tight"
      >
        <h1>
          Verify your Stimulus Reflex+Tailwind Setup
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
            ><span style="color: #f92672">&lt;a</span> <span style="color: #a6e22e">href=</span><span style="color: #e6db74">&quot;#&quot;</span>
  <span style="color: #a6e22e">data-reflex=</span><span style="color: #e6db74">&quot;click-&gt;CounterReflex#increment&quot;</span>
  <span style="color: #a6e22e">data-step=</span><span style="color: #e6db74">&quot;1&quot;</span> 
  <span style="color: #a6e22e">data-count=</span><span style="color: #e6db74">&quot;&lt;%= @count.to_i %&gt;&quot;</span>
  <span style="color: #a6e22e">class=</span><span style="color: #e6db74">&quot;underline&quot;</span>
<span style="color: #f92672">&gt;</span><span style="color: #eee">
  Click me to increment the number:</span>
  <span style="color: #f92672">&lt;span</span> <span style="color: #a6e22e">class=</span><span style="color: #e6db74">&quot;text-red-500 text-2xl&quot;</span><span style="color: #f92672">&gt;</span>
    <span style="color: #f92672">&lt;%= </span><span style="color: #eee">@count.to_i</span><span style="color: #f92672"> %&gt;</span>
  <span style="color: #f92672">&lt;/span&gt;</span>
<span style="color: #f92672">&lt;/a&gt;</span>
</pre>
          </div>
        </li>
        <li>> <code>touch app/reflexes/counter_reflex.rb</code></li>
        <li>
          paste this into
          <span class="italic">app/reflexes/counter_reflex.rb</span>:

          <div
            style="background: #272822; overflow:auto;width:auto;padding:.2em .6em;"
            class="px-5 my-5"
          >
            <pre
              style="margin: 0; line-height: 125%"
            ><span style="color: #66d9ef">class</span> <span style="color: #a6e22e">CounterReflex</span> <span style="color: #f92672">&lt;</span> <span style="color: #e6db74">StimulusReflex</span><span style="color: #f8f8f2">:</span><span style="color: #e6db74">:Reflex</span>
  <span style="color: #66d9ef">def</span> <span style="color: #a6e22e">increment</span>
    <span style="color: #f8f8f2">@count</span> <span style="color: #f92672">=</span> <span style="color: #f8f8f2">element</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">dataset</span><span style="color: #f92672">[</span><span style="color: #e6db74">:count</span><span style="color: #f92672">].</span><span style="color: #f8f8f2">to_i</span> <span style="color: #f92672">+</span> <span style="color: #f8f8f2">element</span><span style="color: #f92672">.</span><span style="color: #f8f8f2">dataset</span><span style="color: #f92672">[</span><span style="color: #e6db74">:step</span><span style="color: #f92672">].</span><span style="color: #f8f8f2">to_i</span>
  <span style="color: #66d9ef">end</span>
<span style="color: #66d9ef">end</span>
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
          The number should be red (verifies that TailwindCSS works) and should
          be incrementing when you click the "Click me to increment the number:"
          link (verifies that Stimulus works)
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

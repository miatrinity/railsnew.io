<template>
  <div class="max-w-2xl py-0 px-6 mx-auto mt-16 mb-20">
    <h1
      class="text-4xl font-semibold antialiased text-gray-700 tracking-tight leading-tight mb-6"
    >
      Verify your Stimulus+Tailwind Setup
    </h1>
    <ol class="list-decimal leading-loose">
      <li>cd into the generated app</li>
      <li><pre>> rails g controller verify index</pre></li>
      <li>
        paste this into
        <span class="italic">app/views/verify/index.html.erb</span>:
        <pre
          class="hljs"
          style="display: block; overflow-x: auto; padding: 0.5em; background: rgb(39, 40, 34) none repeat scroll 0% 0%; color: rgb(221, 221, 221);"
        ><span class="xml">        <span class="hljs-tag" style="color: rgb(249, 38, 114);">&lt;<span class="hljs-name" style="color: rgb(249, 38, 114);">a</span> <span class="hljs-attr">href</span>=<span class="hljs-string" style="color: rgb(166, 226, 46);">"#"</span>
          <span class="hljs-attr">data-reflex</span>=<span class="hljs-string" style="color: rgb(166, 226, 46);">"click-&gt;CounterReflex#increment"</span>
          <span class="hljs-attr">data-step</span>=<span class="hljs-string" style="color: rgb(166, 226, 46);">"1"</span> 
          <span class="hljs-attr">data-count</span>=<span class="hljs-string" style="color: rgb(166, 226, 46);">"&lt;%=</span></span></span><span class="ruby"> @count.to_i </span><span class="xml"><span class="hljs-tag" style="color: rgb(249, 38, 114);"><span class="hljs-string" style="color: rgb(166, 226, 46);">%&gt;"</span>
          <span class="hljs-attr">class</span>=<span class="hljs-string" style="color: rgb(166, 226, 46);">"underline"</span>
        &gt;</span>Click me to increment the number:
          <span class="hljs-tag" style="color: rgb(249, 38, 114);">&lt;<span class="hljs-name" style="color: rgb(249, 38, 114);">span</span> <span class="hljs-attr">class</span>=<span class="hljs-string" style="color: rgb(166, 226, 46);">"text-red-500 text-2xl"</span>&gt;</span> <span class="hljs-tag" style="color: rgb(249, 38, 114);">&lt;<span class="hljs-name" style="color: rgb(249, 38, 114);">%=</span></span></span><span class="ruby"> @count.to_i </span><span class="xml"><span class="hljs-tag" style="color: rgb(249, 38, 114);">%&gt;</span><span class="hljs-tag" style="color: rgb(249, 38, 114);">&lt;/<span class="hljs-name" style="color: rgb(249, 38, 114);">span</span>&gt;</span>
        <span class="hljs-tag" style="color: rgb(249, 38, 114);">&lt;/<span class="hljs-name" style="color: rgb(249, 38, 114);">a</span>&gt;</span></span></pre>
      </li>
      <li>
        create app/reflexes/counter_reflex.rb
      </li>
      <li>
        paste this into app/reflexes/counter_reflex.rb:

        <pre>
          class CounterReflex &lt; StimulusReflex::Reflex
            def increment
              @count = element.dataset[:count].to_i + element.dataset[:step].to_i
            end
          end
        </pre>
      </li>
      <li>run webpack-dev-server</li>
      <li>run rails -s</li>
      <li>hit http://localhost:3000/verify/index</li>
    </ol>

    The number should be red and should be incrementing when you click the
    "Click me to increment the number:" link
  </div>
</template>

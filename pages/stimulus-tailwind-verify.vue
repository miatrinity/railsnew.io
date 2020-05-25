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
        <div
          style="background: #272822; overflow:auto;width:auto;"
          class="px-5 my-5"
        >
          <pre style="margin: 0; line-height: 125%">      
<span style="color: #f92672">&lt;div</span> <span style="color: #a6e22e">data-controller=</span><span style="color: #e6db74">&quot;hello&quot;</span><span style="color: #f92672">&gt;</span>
  <span style="color: #f92672">&lt;h1</span> <span style="color: #a6e22e">data-target=</span><span style="color: #e6db74">&quot;hello.output&quot;</span> <span style="color: #a6e22e">class=</span><span style="color: #e6db74">&quot;text-red-300&quot;</span><span style="color: #f92672">&gt;&lt;/h1&gt;</span>
<span style="color: #f92672">&lt;/div&gt;</span>
          </pre>
        </div>
      </li>
      <li>> <code>bin/webpack-dev-server</code></li>
      <li>> <code>bin/rails s</code></li>
      <li>
        Visit
        <a
          href="http://localhost:3000/verify/index"
          class="underline text-indigo-800"
          >http://localhost:3000/verify/index</a
        >
      </li>
    </ol>
  </div>
</template>

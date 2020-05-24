<template>
  <div>
    <ol>
      <li>cd into the generated app</li>
      <li>rails g controller verify index</li>
      <li>
        paste this into app/views/verify/index.html.erb:

        <pre>
        &lt;div data-controller="hello"&gt;
          &lt;h1 data-target="hello.output" class="text-danger"&gt;&lt;/h1&gt;
        &lt;/div&gt;
          
        </pre>
      </li>
      <li>run webpack-dev-server</li>
      <li>run rails -s</li>
      <li>hit http://localhost:3000/verify/index</li>
    </ol>
    <p>You should see 'Hello, Stimulus' in red</p>
  </div>
</template>

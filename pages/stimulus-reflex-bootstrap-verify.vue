<template>
  <div>
    <ol>
      <li>cd into the generated app</li>
      <li>rails g controller verify index</li>
      <li>
        paste this into app/views/verify/index.html.erb:

        <pre>
          &lt;a href="#"
            data-reflex="click-&gt;CounterReflex#increment"
            data-step="1" 
            data-count="&lt;%= @count.to_i %&gt;"
            class="underline"
          &gt;Click me to increment the number:
            &lt;span class="text-danger display-4"&gt; &lt;%= @count.to_i %&gt;&lt;/span&gt;
          &lt;/a&gt;
        </pre>
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

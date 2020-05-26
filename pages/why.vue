<template>
  <div
    class="max-w-2xl py-0 px-6 mx-auto mt-0 mb-20 md:mt-10 lg:mt-16 xl:mt-18 mb-20"
  >
    <div class="flex">
      <img
        class="h-10 px-3"
        src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9IjUxMnB4IiB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgd2lkdGg9IjUxMnB4Ij48cGF0aCBkPSJtMjc3LjMzMjAzMSAzODRjMCAxMS43ODEyNS05LjU1MDc4MSAyMS4zMzIwMzEtMjEuMzMyMDMxIDIxLjMzMjAzMXMtMjEuMzMyMDMxLTkuNTUwNzgxLTIxLjMzMjAzMS0yMS4zMzIwMzEgOS41NTA3ODEtMjEuMzMyMDMxIDIxLjMzMjAzMS0yMS4zMzIwMzEgMjEuMzMyMDMxIDkuNTUwNzgxIDIxLjMzMjAzMSAyMS4zMzIwMzF6bTAgMCIgZmlsbD0iIzAwMDAwMCIvPjxwYXRoIGQ9Im0yNTYgMzE0LjY2Nzk2OWMtOC44MzIwMzEgMC0xNi03LjE2Nzk2OS0xNi0xNnYtMjEuNTQ2ODc1YzAtMjAuMzA4NTk0IDEyLjg4NjcxOS0zOC41MDc4MTMgMzIuMDE5NTMxLTQ1LjI2OTUzMiAyNS41MTU2MjUtOC45ODA0NjggNDIuNjQ4NDM4LTM2LjE0MDYyNCA0Mi42NDg0MzgtNTUuODUxNTYyIDAtMzIuMzYzMjgxLTI2LjMwNDY4OC01OC42Njc5NjktNTguNjY3OTY5LTU4LjY2Nzk2OXMtNTguNjY3OTY5IDI2LjMwNDY4OC01OC42Njc5NjkgNTguNjY3OTY5YzAgOC44MzIwMzEtNy4xNjc5NjkgMTYtMTYgMTZzLTE2LTcuMTY3OTY5LTE2LTE2YzAtNDkuOTg0Mzc1IDQwLjY4MzU5NC05MC42Njc5NjkgOTAuNjY3OTY5LTkwLjY2Nzk2OXM5MC42Njc5NjkgNDAuNjgzNTk0IDkwLjY2Nzk2OSA5MC42Njc5NjljMCAzNS41ODU5MzgtMjguMDk3NjU3IDczLjM4NjcxOS02My45ODA0NjkgODYuMDM5MDYyLTYuMzc4OTA2IDIuMjM4MjgyLTEwLjY4NzUgOC4zMTY0MDctMTAuNjg3NSAxNS4xMDE1NjN2MjEuNTI3MzQ0YzAgOC44MzIwMzEtNy4xNjc5NjkgMTYtMTYgMTZ6bTAgMCIgZmlsbD0iIzAwMDAwMCIvPjxwYXRoIGQ9Im00NTMuMzMyMDMxIDUxMmgtMzk0LjY2NDA2MmMtMzIuMzYzMjgxIDAtNTguNjY3OTY5LTI2LjMwNDY4OC01OC42Njc5NjktNTguNjY3OTY5di0zOTQuNjY0MDYyYzAtMzIuMzYzMjgxIDI2LjMwNDY4OC01OC42Njc5NjkgNTguNjY3OTY5LTU4LjY2Nzk2OWgzOTQuNjY0MDYyYzMyLjM2MzI4MSAwIDU4LjY2Nzk2OSAyNi4zMDQ2ODggNTguNjY3OTY5IDU4LjY2Nzk2OXYzOTQuNjY0MDYyYzAgMzIuMzYzMjgxLTI2LjMwNDY4OCA1OC42Njc5NjktNTguNjY3OTY5IDU4LjY2Nzk2OXptLTM5NC42NjQwNjItNDgwYy0xNC42OTkyMTkgMC0yNi42Njc5NjkgMTEuOTY4NzUtMjYuNjY3OTY5IDI2LjY2Nzk2OXYzOTQuNjY0MDYyYzAgMTQuNjk5MjE5IDExLjk2ODc1IDI2LjY2Nzk2OSAyNi42Njc5NjkgMjYuNjY3OTY5aDM5NC42NjQwNjJjMTQuNjk5MjE5IDAgMjYuNjY3OTY5LTExLjk2ODc1IDI2LjY2Nzk2OS0yNi42Njc5Njl2LTM5NC42NjQwNjJjMC0xNC42OTkyMTktMTEuOTY4NzUtMjYuNjY3OTY5LTI2LjY2Nzk2OS0yNi42Njc5Njl6bTAgMCIgZmlsbD0iIzAwMDAwMCIvPjwvc3ZnPgo="
      />
      <h1
        class="text-4xl font-semibold antialiased text-gray-700 tracking-tight leading-tight mb-6"
      >
        Why?
      </h1>
    </div>

    <paragraph>
      There’s no shortage of confused/frustrated/angry tweets, forum messages,
      and WTFs about creating a new Rails app from scratch.
    </paragraph>

    <div>
      <img src="~/assets/why-tweets/rails-new-1.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-2.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-10.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-12.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-3.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-4.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-5.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-6.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-7.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-8.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-9.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-11.png" class="mb-1 mx-auto" />
      <img src="~/assets/why-tweets/rails-new-13.png" class="mb-8 mx-auto" />
    </div>

    <paragraph>
      And that's just what I gathered in a couple of minutes, following a quick
      'rails new' twitter search 😅.
    </paragraph>

    <paragraph>
      <a href="https://discuss.rubyonrails.org/t/interactive-rails-new/74355">
        It’s one of the most popular threads (second, at the time of writing) in
        the 2020’s “May of WTFs”
        <img src="~/assets/rails-new-wtf.png" class="mb-10 mt-10" />
      </a>
    </paragraph>

    <paragraph>
      Even DHH weighed in on the subject:
      <img src="~/assets/rails-new-wtf-dhh.png" class="mb-10 mt-10" />
    </paragraph>

    <paragraph>
      The same command that used to be every Rails dev’s favorite has become a
      source of angst and developer fatigue. How did we get here, and more
      importantly, how should we fix it?
    </paragraph>

    <paragraph>
      It might seem like a trivial issue (‘just slap on an extra parameter
      —-minimal’) so why the fuss?
      <img src="~/assets/rails-new-minimal.png" class="mb-10 mt-10" />
    </paragraph>

    <paragraph>
      Well, if you start thinking about a generic solution that would benefit
      the community at large (newbies and veterans alike), you’ll soon realize
      that it’s necessarily going to be surprisingly complex and nuanced:
    </paragraph>

    <paragraph>
      1) it’s difficult to agree even on the most basic terms. ‘simplistic’,
      ‘everyday’, ‘circa-2007’, ‘used for most apps’ means something else for
      everyone.
    </paragraph>

    <paragraph>
      2) even once that’s clarified, there's plenty of implementational
      complexity. Command line flags (which? how many? how should they work?) or
      interactive mode (choosing the bits and pieces that should be generated)
      or something else?
    </paragraph>

    <paragraph>
      railsnew.io falls into the ‘something else’ category: it’s a web app to
      <span class="italic">generate the command line</span>. Once it’s
      generated, you just need to copy'n'paste and run it. No need for further
      customization, extra flags or interactive mode: the generated command line
      captures <span class="italic">everything you want your app to be</span>.
    </paragraph>

    <div class="mb-10 mt-10">
      <img src="~/assets/demo1.gif" />
    </div>

    <paragraph>
      It might sound backwards to visit a webpage in order to accomplish an
      inherently command line-based task, so here are some benefits to consider:
    </paragraph>

    <paragraph>
      1. Avoiding 'buying a latte in a hipster coffee shop' syndrome: sometimes
      you just want a latte, and you don't know/care what to pick
      <span class="italic">exactly</span>: 0.5%/1%/2%/3% milk?
      soy/almond/rice/tapioca/buffalo/yak? bio/organic/vegan/fair trade?
      hazelnut/toffee/organic pine nut/red-velvet-sorbet syrup? half-caff,
      doppio, poured over brewed coffee, dipped, iced, stirred but not shaken?
      JUST GIVE ME MY FUCKING LATTE ALREADY. Please?!<br />
      But the questions just keep coming relentlessly! This is fine if you are a
      coffee aficionado, but if you are ordering your first latte, you might
      want to take your time and understand your options.
    </paragraph>

    <paragraph> <img src="~/assets/sbux.jpg" /> </paragraph>

    <paragraph>
      2. Storing and re-using your favorite `rails new` command lines (COMING
      SOON - with the public release). Perhaps minimalistic (whatever that means
      to YOU), stimulus-enabled or omakase BUT (postgres, rspec, no emails - you
      get the idea). Set up once, use anytime in the future!
    </paragraph>
    <paragraph>
      3. Describing how each flag works / Linking to documentation / Displaying
      what files would be added or changed (with diffs) etc. (COMING SOON - with
      the public release)
    </paragraph>
    <paragraph>
      If it sounds interesting, check out the
      <n-link to="live-demo">live demo</n-link> and give it a spin!
    </paragraph>
  </div>
</template>

<script>
import Paragraph from '@/components/atoms/Paragraph.vue'

export default {
  components: {
    Paragraph
  }
}
</script>

<template>
  <div
    class="max-w-2xl py-0 px-6 mx-auto mt-0 mb-20 md:mt-10 lg:mt-16 xl:mt-18 mb-20"
  >
    <h1
      class="text-4xl font-semibold antialiased text-gray-700 tracking-tight leading-tight mb-6"
    >
      Behind the Scenes
    </h1>
    <paragraph>
      railsnew.io was originally created by us: Mia Sinek and Trinity Takei. Hi
      👋! We are an indie maker couple currently living in sunny Valencia, Spain
      🇪🇸. If you are in the area, drop by for a ☕️ (it's on us)!
    </paragraph>

    <paragraph>
      <img src="~/assets/mia-trinity.jpeg" class="mb-5 mt-5" />
    </paragraph>

    <paragraph>
      After working on everyone else’s dreams for almost two decades, we are
      ready to pursue our own. railsnew.io is our first baby step, but there’s
      definitely more to come - stay tuned!
    </paragraph>

    <h2
      class="text-3xl font-semibold antialiased text-gray-700 tracking-tight leading-tight mb-6"
    >
      Get in Touch
    </h2>

    <paragraph>
      If you have any feedback, suggestion, or just want to say hi, do get in
      touch - we'd ❤️ to hear from you! Here are a few ways to contact us:
    </paragraph>

    <ul class="text-lg">
      <li>
        📧 Shoot us an email at
        <a
          class="underline text-indigo-800"
          href="mailto:mia.trinity.codes@gmail.com"
          >mia.trinity.codes@gmail.com</a
        >
      </li>
      <li>
        🐦 Tweet at
        <a
          class="underline text-indigo-800"
          href="https://twitter.com/TrinityTakei"
          >@trinitytakei</a
        >
        (<a
          class="underline text-indigo-800"
          href="https://twitter.com/MiaSinek"
          >@mia</a
        >
        is on a digital detox📟🥦🥬🥒 for now ¯\_(ツ)_/¯)
      </li>
      <li>
        🐙 Follow us on
        <a
          class="underline text-indigo-800"
          href="https://gist.github.com/miatrinity"
          >miatrinity@GitHub</a
        >
      </li>
      <li>
        🔜 Coming soon: a #Ruby #Rails #CodingTips #Devlife #IndieMaker blog
      </li>
    </ul>
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

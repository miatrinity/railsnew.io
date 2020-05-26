<template>
  <div
    class="max-w-2xl py-0 px-6 mx-auto mt-0 mb-20 md:mt-10 lg:mt-16 xl:mt-18 mb-20"
  >
    <h1
      class="text-4xl font-semibold antialiased text-gray-700 tracking-tight leading-tight mb-6"
    >
      Thanks for Signing up! We are thrilled to have you!
    </h1>
    <paragraph>
      To be honest, we didn't think anyone is going to use the signup field (but
      the design looked great, so we didn't want to remove it ¯\_(ツ)_/¯). Thus,
      we decided to make it work, just in case. Aaaand, here we go!
    </paragraph>

    <paragraph>
      That said, now that you (and presumably others before you) have signed up,
      we will start sending out updates/news etc.
    </paragraph>

    <paragraph>
      Speak soon,<br />
      Mia && Trinity
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

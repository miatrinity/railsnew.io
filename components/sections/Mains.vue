<template>
  <check-box-section
    :items="items"
    section-name="Mains 🍗"
    description="The meat of your setup. Some of us are on a fancy diet, though
                  - or vegans 🥑, even!"
  />
</template>

<script>
import CheckBoxSection from '@/components/organisms/CheckBoxSection.vue'

export default {
  components: {
    CheckBoxSection
  },
  props: {
    items: {
      type: Array,
      default() {
        return []
      }
    }
  }
}
</script>

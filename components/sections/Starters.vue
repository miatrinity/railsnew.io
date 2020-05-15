<template>
  <check-box-section
    :items="items"
    section-name="Starters 🥗"
    description="Stuff to create/skip during initial setup"
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

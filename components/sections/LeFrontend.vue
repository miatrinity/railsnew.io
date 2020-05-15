<template>
  <check-box-section
    :items="items"
    section-name="Le Frontend 🖼️"
    description="Tasty bits from the Front of the House"
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

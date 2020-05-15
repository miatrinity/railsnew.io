<template>
  <check-box-section
    :items="items"
    section-name="Testing 🔬"
    description="MiniSpec or RSpec, that is the real quesiton!"
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

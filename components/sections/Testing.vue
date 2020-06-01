<template>
  <div class="mb-20">
    <check-box-section
      :items="items"
      section-name="Testing 🔬"
      description="MiniSpec or RSpec, that is the real question!"
    />
  </div>
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

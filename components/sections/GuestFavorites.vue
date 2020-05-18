<template>
  <check-box-section
    :items="items"
    section-name="Guest Favorites 🌶️"
    description="The raison d'être of our humble establishment."
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

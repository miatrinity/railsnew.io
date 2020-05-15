<template>
  <check-box-section
    :items="items"
    section-name="Email me Maybe (#not) 📨"
    description="The best way to inbox zero: not sending or receiving any email!"
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

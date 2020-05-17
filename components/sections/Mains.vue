<template>
  <div id="rails-menu-card-holder" class="bg-grey-100">
    <div class="max-w-2xl mx-auto py-6 sm:px-6 lg:px-8">
      <div id="rails-menu-card" class="max-w-none mx-auto">
        <div class="bg-white overflow-hidden sm:rounded-lg sm:shadow">
          <div
            id="rails-menu-card-header"
            class="bg-gray-200 px-4 py-5 border-b border-gray-200 sm:px-6"
          >
            <div
              class="-ml-4 -mt-4 flex justify-between items-center flex-wrap sm:flex-no-wrap"
            >
              <div class="ml-4 mt-4">
                <h3 class="text-lg leading-6 font-medium text-gray-900">
                  Mains 🍗
                </h3>
                <p class="mt-1 text-sm leading-5 text-gray-500">
                  The meat of your setup. Some of us are on a fancy diet, though
                  - or vegans 🥑, even!
                </p>
              </div>
            </div>
          </div>
          <ul id="rails-menu-card-data-rows" aria-disabled="true">
            <check-box-selector
              v-for="item in items"
              :key="item.itemName"
              :item-name="item.itemName"
              :description="item.description"
              :checked="item.checked"
            />
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CheckBoxSelector from '@/components/molecules/CheckBoxSelector.vue'

export default {
  components: {
    CheckBoxSelector
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

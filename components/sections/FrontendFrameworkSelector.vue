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
                  Pick a Frontend Framework! 🧰
                </h3>
                <p class="mt-1 text-sm leading-5 text-gray-500">
                  Need more than basic JavaScript? Pick a Frontend Framework!
                  Note: if you do so, --skip-webpack-install and
                  --skip-javascript will be automatically removed from the final
                  command line (can't have a 🌈 without a little 🌧️)
                </p>
              </div>
            </div>
          </div>
          <ul id="rails-menu-card-data-rows" aria-disabled="true">
            <radio-button-selector
              v-for="item in items"
              :key="item.itemName"
              :selected-item="selectedFrontEndFramework"
              :group="item.group"
              :item-name="item.itemName"
              :description="item.description"
              ><component :is="item.logo"
            /></radio-button-selector>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// import SqLiteLogo from '@/components/svgs/SqLiteLogo'
import RadioButtonSelector from '@/components/molecules/RadioButtonSelector'

export default {
  components: {
    // SqLiteLogo,
    RadioButtonSelector
  },
  props: {
    items: {
      type: Array,
      default() {
        return []
      }
    },
    selectedFrontEndFramework: {
      type: String,
      default: ''
    }
  }
}
</script>

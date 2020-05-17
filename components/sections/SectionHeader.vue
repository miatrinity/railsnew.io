<template>
  <div class="max-w-full mx-auto pt-6 sm:px-6 lg:px-8">
    <!-- <div class="max-w-2xl mt-10 py-6 mx-auto"> -->
    <div
      id="rails-menu-card"
      class="max-w-none mx-auto opacity-25 bg-indigo-100 w-full px-6 py-4 rounded-lg shadow-lg"
    >
      <h1 class="text-2xl antialiased font-black opacity-100">
        {{ title }}
      </h1>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      default: ''
    }
  }
}
</script>

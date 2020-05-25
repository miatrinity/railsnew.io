<template>
  <div id="rails-menu-card-holder">
    <div class="max-w-2xl mx-auto py-6 sm:px-6 lg:px-8">
      <div id="rails-menu-card" class="max-w-none mx-auto">
        <div class="bg-white overflow-hidden sm:rounded-lg sm:shadow">
          <div
            id="rails-menu-card-header"
            class="bg-blue-900 px-4 py-5 border-b border-gray-200 sm:px-6"
          >
            <div
              class="-ml-4 -mt-4 flex justify-between items-center flex-wrap sm:flex-no-wrap"
            >
              <div class="ml-4 mt-4">
                <div class="flex">
                  <h3 class="text-lg leading-6 font-medium text-indigo-200 m-0">
                    Time to Start Cooking!
                  </h3>
                  <img
                    class="h-6 px-3"
                    src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA1MDMuOTQ3IDUwMy45NDciIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUwMy45NDcgNTAzLjk0NzsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI1MTJweCIgaGVpZ2h0PSI1MTJweCI+CjxwYXRoIHN0eWxlPSJmaWxsOiNFRkM3NUU7IiBkPSJNMTU2Ljc2MiwzNTUuMjE0YzIyLjA1NSwyMi4wNTUsMjIuMDU1LDU4LjI4OSwwLDgwLjM0NWMtMjIuMDU1LDIyLjA1NS04Ny4wNCw1MC44MDYtMTA5LjA5NSwyOC43NTEgIHM2LjY5NS04Ny4wNCwyOC43NTEtMTA5LjA5NUM5OC40NzMsMzMzLjE1OSwxMzQuMzEzLDMzMy4xNTksMTU2Ljc2MiwzNTUuMjE0eiIvPgo8cGF0aCBzdHlsZT0iZmlsbDojREVCOTU3OyIgZD0iTTkwLjk5LDM0NC41OHYyLjM2M2MwLDQwLjk2LDMzLjQ3Nyw3NC40MzcsNzQuNDM3LDc0LjQzN2gxLjU3NSAgYzExLjAyOC0yMS4yNjgsNy40ODMtNDguMDQ5LTEwLjYzNC02Ni4xNjZDMTM5LjAzOSwzMzcuNDkxLDExMi4yNTgsMzMzLjk0Niw5MC45OSwzNDQuNTh6Ii8+CjxwYXRoIHN0eWxlPSJmaWxsOiNGMjZDNEY7IiBkPSJNMjcyLjU1MywyMzEuNTQ2YzY3LjM0OCw2Ny4zNDgsODAuNzM4LDE2My4wNTIsMTYuOTM1LDIyNi44NTVsLTMwLjMyNiwzMC4zMjYgIGMtNjMuODAzLDYzLjgwMy0xOS42OTItODkuNDAzLTg3LjA0LTE1Ni43NTFzLTIyMC45NDgtMjIuODQzLTE1Ni43NTEtODcuMDRsMzAuMzI2LTMwLjMyNiAgQzEwOS41MDEsMTUwLjgwOCwyMDUuMjA1LDE2NC4xOTksMjcyLjU1MywyMzEuNTQ2TDI3Mi41NTMsMjMxLjU0NnoiLz4KPHBhdGggc3R5bGU9ImZpbGw6I0Y0RjBEMzsiIGQ9Ik00OTUuNDcsOC42MjljMjAuNDgsMjAuNDgsMTEuNDIyLDE1MC40NDktMTE0LjIxNSwyNzYuNDggIGMtODEuOTIsODEuNTI2LTEzMy41MTQsMTEwLjI3Ny0xMzMuNTE0LDExMC4yNzdjLTU0Ljc0NSwzNy4wMjItODEuMTMyLDExLjgxNS0xMTUuNzkxLTIyLjg0M3MtNjAuMjU4LTYxLjA0Ni0yMi44NDMtMTE1Ljc5MSAgYzAsMCwyOS4xNDUtNTEuOTg4LDExMC42NzEtMTMzLjkwOEMzNDUuNDE0LTIuNzkyLDQ3NC45OS0xMi4yNDQsNDk1LjQ3LDguNjI5TDQ5NS40Nyw4LjYyOXoiLz4KPHBhdGggc3R5bGU9ImZpbGw6I0U4RTRDODsiIGQ9Ik0yNjkuNDAyLDM3Ny42NjNjLTU3LjEwOCwzOC4yMDMtODQuNjc3LDEyLjIwOS0xMjAuNTE3LTIzLjYzMSAgYy0zNi4yMzQtMzYuMjM0LTYyLjYyMi02My40MDktMjMuNjMxLTEyMC41MTdsNS45MDgtOS40NTJjLTE1LjM2LDIwLjg3NC0yMi4wNTUsMzIuNjg5LTIyLjA1NSwzMi42ODkgIGMtMzcuNDE1LDU0Ljc0NS0xMS44MTUsODEuMTMyLDIyLjg0MywxMTUuNzkxczYxLjA0Niw1OS40NzEsMTE1Ljc5MSwyMi44NDNjMCwwLDI0LjQxOC0xMy43ODUsNjYuNTYtNDguODM3ICBDMjg1LjU1LDM2OC42MDUsMjY5LjQwMiwzNzcuNjYzLDI2OS40MDIsMzc3LjY2M3oiLz4KPHBhdGggc3R5bGU9ImZpbGw6IzhCQTBBQjsiIGQ9Ik0zNjMuNTMxLDE0MC41NjhjMTkuMjk4LDE5LjI5OCwxOS4yOTgsNTAuNDEyLDAsNjkuNzExYy0xOS4yOTgsMTkuMjk4LTUwLjQxMiwxOS4yOTgtNjkuNzExLDAgIGMtMTkuMjk4LTE5LjI5OC0xOS4yOTgtNTAuNDEyLDAtNjkuNzExUzM0NC42MjcsMTIxLjI2OSwzNjMuNTMxLDE0MC41Njh6Ii8+CjxwYXRoIHN0eWxlPSJmaWxsOiNGMjZDNEY7IiBkPSJNMjQ5LjcxLDI2Mi42NmM5Ljg0Niw5Ljg0Ni05LjA1OCw0NC44OTgtNTcuMTA4LDkyLjk0OHMtNzcuMTk0LDYxLjA0Ni04Ny4wNCw1MC44MDYgIGMtOS44NDYtOS44NDYsMi43NTctMzguOTkxLDUwLjgwNi04Ny4wNEMyMDQuODExLDI3MS4zMjUsMjM5LjQ3LDI1Mi40MiwyNDkuNzEsMjYyLjY2eiIvPgo8cGF0aCBzdHlsZT0iZmlsbDojMzI0RDVCOyIgZD0iTTMyOC44NzMsMTM3LjgxMWM5Ljg0NiwwLDE5LjI5OCwzLjkzOCwyNi4zODgsMTEuMDI4YzcuMDg5LDcuMDg5LDExLjAyOCwxNi41NDIsMTEuMDI4LDI2LjM4OCAgcy0zLjkzOCwxOS4yOTgtMTEuMDI4LDI2LjM4OGMtNy4wODksNy4wODktMTYuNTQyLDExLjAyOC0yNi4zODgsMTEuMDI4cy0xOS4yOTgtMy45MzgtMjYuMzg4LTExLjAyOCAgYy03LjA4OS03LjA4OS0xMS4wMjgtMTYuNTQyLTExLjAyOC0yNi4zODhzMy45MzgtMTkuMjk4LDExLjAyOC0yNi4zODhDMzA5LjU3NCwxNDEuNzQ5LDMxOS4wMjcsMTM3LjgxMSwzMjguODczLDEzNy44MTEgICBNMzI4Ljg3MywxMjUuOTk2Yy0xMi42MDMsMC0yNS4yMDYsNC43MjYtMzQuNjU4LDE0LjU3MmMtMTkuMjk4LDE5LjI5OC0xOS4yOTgsNTAuNDEyLDAsNjkuNzExICBjOS40NTIsOS40NTIsMjIuMDU1LDE0LjU3MiwzNC42NTgsMTQuNTcyczI1LjIwNi00LjcyNiwzNC42NTgtMTQuNTcyYzE5LjI5OC0xOS4yOTgsMTkuMjk4LTUwLjQxMiwwLTY5LjcxMSAgQzM1NC4wNzksMTMwLjcyMiwzNDEuNDc2LDEyNS45OTYsMzI4Ljg3MywxMjUuOTk2eiIvPgo8cGF0aCBzdHlsZT0iZmlsbDojRjI2QzRGOyIgZD0iTTM3NC45NTMsMTguNDc2YzMuNTQ1LDI2LjM4OCwxNy43MjMsNTQuMzUxLDQwLjk2LDc3LjU4OGMyMC40OCwyMC4wODYsNDQuMTExLDMzLjQ3Nyw2Ny4zNDgsMzguOTkxICBDNTA5LjI1NCw3MC40NjMsNTA3LjI4NSwyMC44MzksNDk1LjQ3LDguNjI5QzQ4NC4wNDgtMy4xODYsNDM2Ljc4Ny01LjE1NSwzNzQuOTUzLDE4LjQ3NnoiLz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg=="
                  />
                </div>
                <p class="mt-1 text-sm leading-5 text-gray-300">
                  Start from scratch and add a few things, or tweak omakase to
                  your liking!
                </p>
              </div>
            </div>
          </div>
          <ul id="rails-menu-card-data-rows" aria-disabled="true">
            <radio-button-selector
              v-for="item in items"
              :key="item.itemName"
              :selected-item="selectedBase"
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
import RadioButtonSelector from '@/components/molecules/RadioButtonSelector'

export default {
  components: {
    RadioButtonSelector
  },
  props: {
    items: {
      type: Array,
      default() {
        return []
      }
    },
    selectedBase: {
      type: String,
      default: 'SQLite'
    }
  }
}
</script>

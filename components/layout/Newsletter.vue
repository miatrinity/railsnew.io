<template>
  <div class="bg-gray-700">
    <div
      class="max-w-screen-xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8 lg:flex lg:items-center"
    >
      <div class="lg:w-0 lg:flex-1">
        <h2
          class="text-3xl leading-9 font-extrabold tracking-tight text-white sm:text-4xl sm:leading-10"
        >
          Want product news and updates?
          <br class="hidden sm:inline" />
          <span class="text-red-600">Sign up for our newsletter.</span>
        </h2>
      </div>
      <div class="mt-8 lg:mt-0 lg:ml-8">
        <form
          name="newsletter"
          data-netlify="true"
          action="/newsletter-signup"
          method="POST"
          class="sm:flex"
        >
          <input type="hidden" name="form-name" value="newsletter" />
          <input
            aria-label="Email address"
            type="email"
            name="email"
            required
            class="appearance-none w-full px-5 py-3 border border-transparent text-base leading-6 rounded-md text-gray-900 bg-white placeholder-gray-500 focus:outline-none focus:placeholder-gray-400 transition duration-150 ease-in-out sm:max-w-sx"
            placeholder="Enter your email"
          />
          <div class="mt-3 rounded-md shadow sm:mt-0 sm:ml-3 sm:flex-shrink-0">
            <button
              type="submit"
              class="w-full flex items-center justify-center px-5 py-3 border border-transparent text-base leading-6 font-medium rounded-md text-white bg-indigo-500 hover:bg-indigo-400 focus:outline-none focus:bg-indigo-400 transition duration-150 ease-in-out"
            >
              Notify me
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script></script>

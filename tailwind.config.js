/*
 ** TailwindCSS Configuration File
 **
 ** Docs: https://tailwindcss.com/docs/configuration
 ** Default: https://github.com/tailwindcss/tailwindcss/blob/master/stubs/defaultConfig.stub.js
 */
module.exports = {
  purge: [
    './components/**/*.vue',
    './layouts/**/*.vue',
    './pages/**/*.vue',
    './pages/**/*.html'
  ],
  theme: {
    extend: {
      colors: {
        'bg-semi-75': 'rgba(0, 0, 0, 0.75)'
      }
    }
  },
  variants: {},
  plugins: []
}

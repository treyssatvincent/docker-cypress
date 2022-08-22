const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    baseUrl: 'http://localhost',
    fixturesFolder: false,
    supportFile: false,
  },
})
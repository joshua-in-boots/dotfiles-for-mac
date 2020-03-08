module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      // Open google.com and *.google.com urls in Google Chrome
      match: finicky.matchHostnames([
        "google.com", // match google.com domain as string (to make regular expression less complicated)
        /.*\.google.com$/, // match all google.com subdomains
        /.*\.youtube.com$/, // match all youtube.com subdomains
        /.*\.local$/
      ]),
      browser: "Google Chrome"
    }
  ]
};
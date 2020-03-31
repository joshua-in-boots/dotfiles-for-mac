module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: ({ sourceBundleIdentifier }) => {
        finicky.log(sourceBundleIdentifier);
      },
    browser: "Firefox",
    },
    {
      match: /.*\.notion\.so\/joshuainboots/,
      browser: "Firefox"
    },
    {
      match: /.*\.notion\.so\/logpresso/,
      browser: "Google Chrome"
    },
    {
      match: finicky.matchHostnames([
        /.*\.anglican.kr$/
      ]),
      browser: "Safari"
    },
    {
      // Open google.com and *.google.com urls in Google Chrome
      match: finicky.matchHostnames([
        // "google.com", // match google.com domain as string (to make regular expression less complicated)
        "accounts.google.com",
        "doc.google.com",
        "drive.google.com",
        ///.*\.google.com$/, // match all google.com subdomains
        /.*\.youtube.com$/, // match all youtube.com subdomains
        /.*\.local$/
      ]),
      browser: "Google Chrome"
    }
  ]
};
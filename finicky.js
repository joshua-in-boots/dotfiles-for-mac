module.exports = {
  defaultBrowser: "Firefox",

  handlers: [
    {
      match: ({ sourceBundleIdentifier }) => {
        finicky.log(sourceBundleIdentifier);
      },
    browser: "Firefox",
    },

    // Open my personal notion notes in Firefox
    {
      match: /.*\.notion\.so\/joshuainboots/,
      browser: "Firefox"
    },

    // Open notion nontes of working place in Google Chrome 
    {
      
      match: /.*\.notion\.so\/logpresso/,
      browser: "Google Chrome"
    },

    // Open any anglican.kr links in Safari
    {
      match: finicky.matchHostnames([
        /.*\.anglican.kr$/
      ]),
      browser: "Safari"
    },

    // Open any G Suite files in Google File Stream with Google Chrome
    {
    
      match: ({ sourceBundleIdentifier }) =>
        ["com.google.drivefs"].includes(sourceBundleIdentifier),
      browser: "Google Chrome"
    },

    // Open google.com and youtube.com urls in Google Chrome
    {
    
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
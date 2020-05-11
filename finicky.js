  module.exports = {
  defaultBrowser: "Safari",

  handlers: [
    {
      match: ({ sourceBundleIdentifier }) => {
        finicky.log(sourceBundleIdentifier);
      },
    browser: "Safari",
    },
    {
      
      match: /.*\.notion\.so\/logpresso/,
      browser: "Microsoft Edge"
    },
    {
    
      match: ({ sourceBundleIdentifier }) =>
        ["com.google.drivefs"].includes(sourceBundleIdentifier),
      browser: "Microsoft Edge"
    },
    {
    
      match: finicky.matchHostnames([
        "accounts.google.com",
        "doc.google.com",
        "drive.google.com",
        // match all youtube.com subdomains
        /.*\.youtube.com$/,
        /.*\.local$/
      ]),
      browser: "Microsoft Edge"
    },
    {
    
      match: finicky.matchHostnames([
        "facebook.com",
        /.*\.facebook.com$/
      ]),
      browser: "Firefox"
    }
  ]
};

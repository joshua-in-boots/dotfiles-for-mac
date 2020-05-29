  module.exports = {
  defaultBrowser: "Microsoft Edge",

  handlers: [
    {
      match: ({ sourceBundleIdentifier }) => {
        finicky.log(sourceBundleIdentifier);
      },
    browser: "Microsoft Edge",
    },
    {      
      match: /.*\.anglican\.kr/,
      browser: "Safari"
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
        /.*\.youtube.com$/,
        /.*\.zendesk.com$/,
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

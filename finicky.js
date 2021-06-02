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
      match: finicky.matchHostnames([
        "facebook.com",
        /.*\.facebook.com$/
      ]),
      browser: "Firefox"
    },
    {
      match: /.*\.notion\.so/,
      browser: "Notion"
    }
  ]
};

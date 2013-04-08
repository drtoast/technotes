# Manifest

* http://developer.chrome.com/extensions/manifest.html

`manifest.json`:

    {
      "manifest_version": 2,

      "name": "Pivotal Nag Blocker",
      "description": "Dismiss the annoying you-are-behind-on-hours dialog",
      "version": "1.0",

      "permissions": [
        "tabs", "https://www.pivotaltracker.com/*"
      ],

      "content_scripts": [
        {
          "matches": ["https://www.pivotaltracker.com/*"],
          "css": ["style.css"],
          "js": ["blocker.js"],
          "run_at": "document_idle"
        }
      ]
    }


# Installing

* visit chrome://extensions
* click "load unpacked extension"
* navigate to your extension's folder

# Content Scripts

JavaScript files that run in the context of web pages. Can read/write from/to the DOM.

* http://developer.chrome.com/extensions/content_scripts.html

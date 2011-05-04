=begin
Patrick Ewing
@hoverbird

NewTwitter
  @bs, @ded, @dsa, @esbie, etc

Rendering is hard
  a lot of work to concat a template

Mustache is
  simple (as an idea an implementation)
    next to no logic in template
  fast
  everywhere

Syntax
  {{interpolatino}}
  {{>subtemplate}}
  {{{unescapting}}}

{{#conditional}}
render if true!
{{/conditional}}

{{#enumeration}}
each {{item}} in turn
{{/enumeration}}


no need to test templates because logic is elsewhere

Render time:
  HAML > ERB > mustacheRB > JQueryUI > mustache JS

Implementations:
  everything: scala, ruby, php, etc...

Started using at Twitter over a year ago
  erb rendered tweets, mustache rendered hovercard

NewTwitter: 100% mustache

Why render on client?
  JS rendering is fast! (just sending template once, then raw JSON data to browser)
  easy to share view code across language boundaries
  great for an organization that reuses data objects across boundaries
  
Twitter JavaScript API can render mustache

API.User.find('dsa')
  .timeline()
  .first(20)
  .each(function(tweet) {}) {
    new Views.TweetView(tweet).toHtml;
  };
});

Server-Side Mustache Rendering:
* noscript
* inital page load
* pre-seeding the cache 
  (don't want to first load page then fetch data from API - embed JSON as a string in the page!)
* The Google
  hashbang #! urls are for google, so they get rendered content
  
View Stack
  mustache.js
  mustache.rb for rendering initial layout, googlebot, cache
  templates
  
Template + View:

  JS:
  twttr.view("twttr.views.BaseTweet")
    .superclass(twttr.views.BaseAPI)
    .methods({
      is_top_tweet: function() {
        return this.result_category == 'popular'
      }
      ....
    }
    })
    
  RUBY:
  class StreamTweet < Views::Base
    def linkified_text
      auto_link context['text']
    end
    
    def is_top_tweet
      context['result_category'] === 'popular'
    end
    ...
  end

  MUSTACHE:
  {{#tweet}}
  <span>{{{linkified_text}}}</span>
  {{#user}}tweeted by: {{screen_name}}{{/user}}
  {{#is_top_tweet}}
    <h2>Top Tweet</h2>
  {{#retweeters}}
    <li>{{screen_name}}</li>
  {{/retweeters}}
  </ul>
  {{/tweet}}
  
Drawbacks

JS and Ruby have different coding styles, e.g. camelCase (JS, DOM) vs snake_case (Ruby).
  at Twitter, standardized on camelCase in Ruby and JS
  
no i18n - Twitter implemented as {{_i}}

Conformance Suite
  twitter_text_conformance
  YAML files that specify

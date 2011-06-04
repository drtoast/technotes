# capybara (browser testing) - https://github.com/jnicklas/capybara

# WebRat replacement that runs JavaScript
# Driver Agnostic (switch seamlessly)
#   rack-test (fast, simple, but no JavaScript)
#   Selenium (real browser, but slow, requires GUI)
#   HTMLUnit (headless, good JavaScript support, but slow)
#     Celerity/Culerity/Akephalos
#   Envjs (headless, faster than HTMLUnit, but JavaScript and CSS not 100%)



### Capybara webkit: 

# https://github.com/thoughtbot/capybara-webkit

# 1. install Qt libraries 4.7.3 for Mac: 
# http://qt.nokia.com/downloads

# 2. Add the capybara-webkit gem to your Gemfile:
gem "capybara-webkit"

# 3. Set your Capybara Javascript driver to webkit:
Capybara.javascript_driver = :webkit

# 4. Tag scenarios with @javascript to run them using a headless WebKit browser.

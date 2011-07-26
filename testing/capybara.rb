# Acceptance testing
# https://github.com/jnicklas/capybara

# WebRat replacement that runs JavaScript
# Driver Agnostic (switch seamlessly):
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


### DSL

visit       diagnostic_report(@user)
click_link  "Recommendation"
fill_in     'Intervention', :with => 'B – Complex'

# querying (as RSpec matchers)
page.should have_selector('table tr')
page.should have_selector(:xpath, '//table/tr')
page.should have_no_selector(:content)
page.should have_xpath('//table/tr')
page.should have_css('table tr.foo')
page.should have_content('foo')
page.should have_no_content('foo')

# finding and interacting with elements
# http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Element
find_field('First Name').value
find_link('Hello').visible?
find_button('Send').click
find(:xpath, "//table/tr").click
find("#overlay").find("h1").click
all('a').each { |a| a[:href] }

# filling forms
choose('A Radio Button')
check('A Checkbox')
uncheck('A Checkbox')
attach_file('Image', '/path/to/image.jpg')
select('Option', :from => 'Select Box')

# scoping
within("li#employee") do
  fill_in 'Name', :with => 'Jimmy'
end

within(:xpath, "//li[@id='employee']") do
  fill_in 'Name', :with => 'Jimmy'
end

within_fieldset('Employee') do
  fill_in 'Name', :with => 'Jimmy'
end

within_table('Employee') do
  fill_in 'Name', :with => 'Jimmy'
end

# waiting
wait_until { not page.find('#intervention_overlay').visible? }.should be_true
# this will NOT wait for ajax response:
page.should_not have_xpath('a')
# this WILL wait for ajax response:
page.should have_no_xpath('a')

# save page as html and open in browser
save_and_open_page

# page instance methods:
:app, :body, :cleanup!, :current_path, :current_url, :document, :driver, 
:evaluate_script, :execute_script, :method_missing, :mode, :reset!, 
:response_headers, :save_and_open_page, :source, :status_code, :visit, 
:wait_until, :within, :within_fieldset, :within_frame, :within_table, :within_window

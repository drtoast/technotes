# https://github.com/jnicklas/capybara


### DSL
visit       '/foo/bar'
click_link  "Recommendation"
fill_in     'Intervention', :with => 'B – Complex'


# RSpec matchers
# http://rubydoc.info/github/jnicklas/capybara/Capybara/RSpecMatchers
page.should have_button('.foo')
page.should have_content('foo') # have_no_content('foo')
page.should have_css('table tr.foo')
page.should have_field('.foo')
page.should have_link('title')
page.should have_select('name')
page.should have_selector('table tr') # have_no_selector(:content)
page.should have_selector(:xpath, '//table/tr')
page.should have_table('.foo')
page.should have_unchecked_field('foo')
page.should have_xpath('//table/tr')


# FINDING elements
# http://rubydoc.info/github/jnicklas/capybara/Capybara/Node/Finders
find("#overlay").find("h1").click
find(:xpath, "//table/tr").click
first(".foo")
all('a').each { |a| a[:href] }
find_field('First Name').value
find_link('Hello').visible?
find_button('Send').click


# ACTIONS
# http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Actions
# links and buttons:
click_link('id-of-link')
click_link('Link Text')
click_button('Save')
click_on('Link Text') # clicks on either links or buttons
click_on('Button Value')
# forms:
fill_in('First Name', :with => 'John')
fill_in('Password', :with => 'Seekrit')
fill_in('Description', :with => 'Really Long Text...')
choose('A Radio Button')
check('A Checkbox')
uncheck('A Checkbox')
attach_file('Image', '/path/to/image.jpg')
select('Option', :from => 'Select Box')


# INTERACTING with elements
# http://rubydoc.info/github/jnicklas/capybara/Capybara/Node/Element
find('#foo').checked?
find('#foo').click
find('#foo').drag_to(node)
find('#foo').find('.bar')
find('#foo').first
find('#foo').inspect
find('#foo').select_option
find('#foo').selected?
find('#foo').set('value') # form element
find('#foo').tag_name
find('#foo').text
find('#foo').trigger('blur')
find('#foo').unselect_option
find('#foo').value # form element
find('#foo').visible?


# SCOPING
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

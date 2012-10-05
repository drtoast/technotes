# https://github.com/cavalle/steak
# Minimalist acceptance testing on top of RSpec
# (like Cucumber, but more Ruby-like)

feature "Sign In", %q{
  In order to use the site
  As a user
  I want to log in
} do
  background do
    @diagnostic_report = Factory.create :diagnostic_report
    @user = Factory.build :encryptor_user, :password => 'q1w2e3r4$'
    @user.diagnostic_report = @diagnostic_report
    @user.save
  end

  scenario "should have correct title" do
    visit '/users'
    page.should have_selector 'title'
    find('title').should have_content 'Sign In - WellnessFX'
  end

  scenario "with valid credentials should sign the user in" do
    sign_in @user.email, @user.password

    find('#header').should have_content @user.name
    find('#header').should have_selector '.user'
  end

  scenario "with an incorrect email address should display the invalid credentials notice" do
    sign_in 'doesnotexist@example.com', @user.password

    find('#error_explanation').should have_content 'Invalid email or password'
    page.should have_content 'Sign In'
  end

  scenario "with an incorrect password should display the invalid credentials notice" do
    sign_in @user.email, 'this1sn0tmypassword'

    page.should have_selector '#error_explanation'
    find('#error_explanation').should have_content 'Invalid email or password'
    page.should have_content 'Sign In'
  end

  scenario "with incorrect credentials should remember my email" do
    sign_in @user.email, 'this1sn0tmypassword'

    find('#email').value.should == @user.email
  end

  scenario "with case-insensitive credentials works" do
    sign_in @user.email.upcase, @user.password
    current_path.should == "/users/#{@user.id}/diagnostic_report"
  end

  scenario "Redirect to original destination when succesfully logged in." do
    # Note: Visit the interventions page since we redirect to diagnostic report by default on login
    visit "/users/#{@user.id}/diagnostic_report/interventions"
    current_path.should == "/sign_in"

    sign_in @user.email, @user.password
    current_path.should == "/users/#{@user.id}/diagnostic_report/interventions"
  end
end
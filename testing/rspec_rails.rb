# http://relishapp.com/rspec


### Models

# Expectations
Model.should have(:no).records
Model.should have(1).record
Model.should have(3).records

model.should have(:no).errors_on(:attribute)
model.should have(1).error_on(:attribute)
model.should have(3).errors_on(:attribute)

# Mocks - create an instance of a fake class (not an ActiveModel instance)
car = mock_model("Car")
car.should be_a(Car)

let(:widget) do
  mock_model Widget,  :foo => "bar",
                      :save => true,
                      :update_attributes => false
end

# Stubs - create an instance of a real ActiveModel class
let(:widget) do
  stub_model Widget, :id => 5, :random_attribute => true
end

widget.id.should eql(5)


### Controllers
# views are stubbed as empty string by default. This will actually render views:
render_views true

get :index
response.code.should eq("200")
response.should render_template("index")  # wraps assert_template
response.should redirect_to :action => :show, :id => assigns(:widget).id # wraps assert_redirected_to
response.body.should =~ /Listing widgets/m # only if render_views(true)
assigns(:widget).should be_a_new(Widget)


### Views
assign(:widget, stub_model(Widget, :name => "slicer"))
render :template => "widgets/widget.html.erb"
rendered.should =~ /slicer/



### Routing
{:get => "/articles/2012/11/when-to-use-routing-specs" }.should route_to(:controller => "articles", :month => "2012-11", :slug => "when-to-use-routing-specs")
{:delete => "/accounts/37"}.should_not be_routable

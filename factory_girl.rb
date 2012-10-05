# https://github.com/thoughtbot/factory_girl
# http://rubydoc.info/gems/factory_girl/1.3.3/frames


### DEFINE FACTORIES in test/factories/*.rb:

# This will guess the User class
Factory.define :user do |u|
  u.first_name 'John'
  u.last_name  'Doe'
  u.admin false
end

# This will use the User class (Admin would have been guessed)
Factory.define :admin, :class => User do |u|
  u.first_name 'Admin'
  u.last_name  'User'
  u.admin true
end

# Dependent attributes (Set an attribute using values of other attributes)
Factory.define :user do |u|
  u.first_name 'Joe'
  u.last_name  'Blow'
  u.email {|a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
end

# Associations
Factory.define :post do |p|
  p.author {|author| author.association(:user, :last_name => 'Writely') }
  # OR:
  p.association :author, :factory => :user
end

# Inheritance
Factory.define :approved_post, :parent => :post do |p|
  p.approved true
  # the 'approver' association is required for an approved post
  p.association :approver, :factory => :user
end

# Callbacks
Factory.define :user do |u|
  u.after_build  { |user| do_something_to(user) }
  u.after_create { |user| do_something_else_to(user) }
end



### USE FACTORIES in test/unit/*.rb

# Same as Factory.create :user:
user = Factory(:user)

# Returns a User instance that's not saved
user = Factory.build(:user)

# Returns a saved User instance
user = Factory.create(:user)

# Build a User instance and override the first_name property
user = Factory.build(:user, :first_name => 'Joe')
user.first_name
# => "Joe"
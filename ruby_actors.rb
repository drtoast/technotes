# unit of execution, has a "mailbox", you send it a message
# thread or fiber backed, no application level locks
# MRI/JRuby - no actors
# Rubinius - actor.rb

# https://github.com/tarcieri/celluloid
# OO Actros - async method invocation

# config/initializers/girl_friday
EMAIL_DELIVERY = GirlFriday::Queue.new(:email, :size => 3) do |msg|
  msg.deliver
end

# app/models/my_model.rb
after_save :send_approval_email
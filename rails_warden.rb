# Rails authentication gem:
# https://github.com/hassox/rails_warden

# Warden documentation:
# https://github.com/hassox/warden/wiki

# Warden injects a lazy object into the Rack environment at env['warden']
env['warden']
request.env['warden'].set_user(@user) # signin the user
request.env['warden'].user # the user object 
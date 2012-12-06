### FAKE SERVICE:

# payments/fake_server.rb
module PaymentsService
  class FakeServer < Sinatra::Base
    get "/payments" do
      {
        success: true,
        payments: [
          {
            id: 1,
            amount_cents: 1000
          }
        ]
      }.to_json
    end
  end
end

# payments_config.ru (for rackup)
require 'payments/fake_server'
run Rack::URLMap.new "/" => PaymentsService::FakeServer

# Procfile (for foreman)
server: rails server
payments: rackup --port 3001 payments_config.ru

# Foreman (starts rails app and fake service)
foreman start

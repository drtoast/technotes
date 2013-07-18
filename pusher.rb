# https://app.pusherapp.com/apps/42342/debug
# https://github.com/pusher/pusher-gem
# add PUSHER_URL to env


# LOGGING
Pusher.logger = Rails.logger

# PUBLISHING EVENTS
begin
  Pusher.trigger('a_channel', 'an_event', { some: 'data' })
rescue Pusher::Error => e
  # (Pusher::AuthenticationError, Pusher::HTTPError, or Pusher::Error)
end


# Generate self-signed certificate in development:

  https://gist.github.com/trcarden/3295935

# Run thin with ssl:

  http://www.railway.at/2013/02/12/using-ssl-in-your-local-rails-environment/



... or (haven't tried this:)

  openssl req -new -newkey rsa:2048 -sha1 -days 365 -nodes -x509 -keyout server.key -out server.crt

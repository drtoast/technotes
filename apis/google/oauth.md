http://code.google.com/apis/accounts/docs/OAuth2.html

# OAuth 2.0 for client-side web applications (short-lived token)

1) send user to:

    https://accounts.google.com/o/oauth2/auth?
      client_id=21302922996.apps.googleusercontent.com&
      redirect_uri=https://www.example.com/back&
      scope=https://www.google.com/m8/feeds/&
      response_type=token
  
2) after confirmation, google redirects browser to:

    https://www.example.com/back#access_token=1/QbIbRMWW&expires_in=4301
    
3) then client includes token in API calls:

    curl https://www.google.com/m8/feeds/contacts/default/full?oauth_token=1/QbIbRMWW
    
# OAuth 2.0 for native or server-side web applications (refreshable short-lived token)

1) send user to:

    https://accounts.google.com/o/oauth2/auth?
      client_id=824390819211.apps.googleusercontent.com&
      redirect_uri=https://www.example.com/back&
      scope=https://www.google.com/m8/feeds/&
      response_type=code

for a native app, use this redirect_uri instead, which returns the access code via a web page:

    redirect_uri=urn:ietf:wg:oauth:2.0:oob&

2) after confirmation, google redirects browser to:

    https://www.example.com/back?code=4/P7q7W91a-oMsCeLvIaQm6bTrgtp6
    
3) your server should take that access code and swap it for a long-lived "refresh token" and short-lived "access token" pair:

    POST /o/oauth2/token HTTP/1.1
    Host: accounts.google.com
    Content-Type: application/x-www-form-urlencoded
    
    code=4/P7q7W91a-oMsCeLvIaQm6bTrgtp6&
    client_id=21302922996.apps.googleusercontent.com&
    client_secret=XTHhXh1SlUNgvyWGwDk1EjXB&
    redirect_uri=https://www.example.com/back&
    grant_type=authorization_code
    
for a desktop app, use this redirect_uri instead:

    redirect_uri=urn:ietf:wg:oauth:2.0:oob&
    
4) google returns a refresh token and access token as JSON:

    {
      "access_token":"1/fFAGRNJru1FTz70BzhT3Zg",
      "expires_in":3920,
      "refresh_token":"1/6BMfW9j53gdGImsixUH6kU5RsR4zwI9lUVX-tqf8JXQ"
    }

5) then client includes token in API calls:

    curl https://www.google.com/m8/feeds/contacts/default/full?oauth_token=1/fFAGRNJru1FTz70BzhT3Zg

6) when server eventually replies with "401 not authorized", ask for a new token:

    POST /o/oauth2/token HTTP/1.1
    Host: accounts.google.com
    
    client_id=21302922996.apps.googleusercontent.com&
    client_secret=XTHhXh1SlUNgvyWGwDk1EjXB&
    refresh_token=1/6BMfW9j53gdGImsixUH6kU5RsR4zwI9lUVX-tqf8JXQ&
    grant_type=refresh_token

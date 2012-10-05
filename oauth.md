# Links

http://tools.ietf.org/html/draft-ietf-oauth-v2-31
https://github.com/songkick/oauth2-provider
http://blog.gazler.com/blog/2012/01/08/oauth2-provider-with-rails/
http://blog.gazler.com/blog/2012/01/11/oauth2-consumer-with-sinatra/

# Roles

* client (app that makes the resource request for the owner)
* client owner (the company responsible for the client app)

* resource owner (end user, etc)
* resource server (has the desired data)

* authorization server (issues access tokens to client)

# oauth2-provider gem

https://github.com/songkick/oauth2-provider

    class User < ActiveRecord::Base
      include OAuth2::Model::ResourceOwner
      has_many :interesting_pieces_of_data
    end

    class Company < ActiveRecord::Base
      include OAuth2::Model::ClientOwner
      belongs_to :user
    end

    OAuth2::Model::Client.create(params)
      name, redirect_uri, client_id and client_secret

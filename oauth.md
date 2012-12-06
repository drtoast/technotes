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


# ResourceOwner and ClientOwner:

    User - OAuth2::Model::ResourceOwner (shares data with client)
    Product - OAuth2::Model::ClientOwner (owns "app", consumes data from user)

# 1. Create a product and client (client gets assigned a `client_id` and `client_secret`)

    Admin::ProductsController#create
        @product.oauth2_clients.build(name: @product.name, redirect_uri: ...)
        # client gets assigned a client_id and client_secret

# 2a. Convert any pending authorizations (via store purchase) into access_tokens

    /api/v2/oauth/access_tokens?client_id=12345

    Api::V2::ApiController#load_client
        @client = Songkick::OAuth2::Model::Client.find_by_client_id(params[:client_id])

    Api::V2::OauthController#access_tokens
        @authorizations = current_client.authorizations.where(access_token_hash: nil).all
        @authorizations.map(&:exchange!)

    views/api/v2/oauth/access_tokens.json.builder:
        json.success true
        json.access_tokens do |json|
          json.array!(@authorizations) do |json, auth|
            json.user_id        auth.owner.id
            json.email          auth.owner.email
            json.scopes         auth.scope.split(' ')
            json.access_token   auth.access_token
          end
        end

# 2b. Authorize a client (who requested authorization on the client's site) by exchanging a "code" for an "access_token"

    OauthController#authorize
        @oauth2 = Songkick::OAuth2::Provider.parse(@user, request)
        @oauth2_response = JSON.parse(@oauth2.response_body)
        response.status = @oauth2.response_status

    views/api/v2/oauth/authorize.json.builder:
        if @oauth2.valid?
          json.success true
          json.authorization do |json|
            json.user_id        @user.id
            json.email          @user.email
            json.scopes         @oauth2_response['scope'].split(' ')
            json.access_token   @oauth2_response['access_token']
          end
        else
          json.success false
          json.partial! 'api/v2/errors', errors: ["#{@oauth2.error}: #{@oauth2.error_description}"]
        end
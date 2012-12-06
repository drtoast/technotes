=begin

http://api.rubyonrails.org/classes/Rails/Railtie.html
http://rack.rubyforge.org/doc/SPEC.html

to list all middleware in your rails app:
    rake middleware
=end


# SAMPLE RACK APP:


# define a railtie to extend our Rails app:
module HttpAcceptLanguage

  # define a subclass of Rails::Railtie
  class Railtie < ::Rails::Railtie

    # this block will be automatically called during the rails boot process
    initializer "http_accept_language.add_middleware" do |app|

      # tell the Rails application object to use our HttpAcceptLanguage::Middleware
      app.middleware.use Middleware

      # add functionality to ApplicationController
      ApplicationController.send :include, EasyAccess
    end

  end

  module EasyAccess
    # add a helper method to be used in ApplicationController
    def http_accept_language
      env.http_accept_language
    end
  end

end


# define a rack app in lib:
module HttpAcceptLanguage
  class Middleware

    # app is our rails app
    def initialize(app)
      @app = app
    end

    # called on each request.
    # takes one param: env hash
    # returns array of three values: [status, headers, response]
    def call(env)
      # add a method to env
      def env.http_accept_language
        @http_accept_language ||= Parser.new(self['HTTP_ACCEPT_LANGUAGE'])
      end
      @app.call(env)
    end

  end
end


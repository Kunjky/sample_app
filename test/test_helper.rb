require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

module ActiveSupport
  class TestCase
    fixtures :all
    include ApplicationHelper

    # Log in as a particular user.
    def log_in_as user
      session[:user_id] = user.id
    end

    # Returns true if a test user is logged in.
    def is_logged_in?
      !session[:user_id].nil?
    end
  end
end

module ActionDispatch
  class IntegrationTest
    # Log in as a particular user.
    def log_in_as user, password: "password", remember_me: "1"
      post login_path, params: {session: {email: user.email,
                                          password: password,
                                          remember_me: remember_me}}
    end
  end
end

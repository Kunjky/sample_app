require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

module ActiveSupport
  class TestCase
    fixtures :all
    include ApplicationHelper

    # Returns true if a test user is logged in.
    def is_logged_in?
      !session[:user_id].nil?
    end
  end
end

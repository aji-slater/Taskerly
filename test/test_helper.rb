ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/reporters'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all
  before do
    if User.count < 1
      FactoryGirl.create(:user)
    end
  end

  # Add more helper methods to be used by all tests here...
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

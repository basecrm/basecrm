require 'rspec/collection_matchers'
require 'factory_bot'
require 'faker'
require 'securerandom'

require 'basecrm'

module FactoryBot
  module Strategy
    class Create
      def result(evaluation)
        evaluation.create(evaluation.object)
      end
    end
  end
end

Dir[File.join(__dir__, "/support/**/*.rb")].each { |f| require f }
FactoryBot.find_definitions

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.expect_with :rspec do |expectations|
    # It makes the `description` and `failure_message` of custom matchers include text for helper methods
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.order = :random

  config.raise_errors_for_deprecations!
end

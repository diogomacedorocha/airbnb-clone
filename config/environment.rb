# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Dotenv::Railtie.load if defined?(Dotenv)

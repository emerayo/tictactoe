# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require_relative '../tictactoe'

RSpec.configure do |config|
  config.before { allow($stdout).to receive(:puts) }
end

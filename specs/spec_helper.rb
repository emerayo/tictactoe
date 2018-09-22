# frozen_string_literal: true

require_relative '../tictactoe'

RSpec.configure do |config|
  config.before { allow($stdout).to receive(:puts) }
end

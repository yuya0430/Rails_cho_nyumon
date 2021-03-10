# frozen_string_literal: true

Kaminari.configure do |config|
  config.default_per_page = 10
  config.window = 3
  config.outer_window = 1
end

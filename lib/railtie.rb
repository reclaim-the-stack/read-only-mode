# frozen_string_literal: true

module ReadOnlyMode
  class Railtie < Rails::Railtie
    initializer "read-only-mode.configure_rails_initialization" do |app|
      app.middleware.insert_before 0, ReadOnlyMode::Middleware if ReadOnlyMode.enabled?
    end
  end
end

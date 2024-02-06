# frozen_string_literal: true

module ReadOnlyMode
  class Railtie < Rails::Railtie
    initializer "read-only-mode.configure_rails_initialization" do
      app.middleware.use ReadOnlyMode::Middleware if ReadOnlyMode.enabled?
    end
  end
end

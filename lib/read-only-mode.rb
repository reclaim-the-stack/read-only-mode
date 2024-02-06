# frozen_string_literal: true

require "json"

module ReadOnlyMode
  DEFALT_HTML_RESPONSE = File.read(File.expand_path("read_only_mode.html", __dir__))
  DEFAULT_JSON_RESPONSE = { error: "Application is in read-only maintenance mode. Please try again later." }.to_json

  def self.enabled?
    ENV["READ_ONLY_MODE"] == "true" || ENV["PGOPTIONS"]&.include?("default_transaction_read_only=on")
  end

  def self.html_response=(html_response)
    @html_response = html_response
  end

  def self.html_response
    @html_response ||= DEFALT_HTML_RESPONSE
  end

  def self.json_response=(json_response)
    @json_response = json_response
  end

  def self.json_response
    @json_response ||= DEFAULT_JSON_RESPONSE
  end
end

require_relative "middleware"
require_relative "railtie" if defined? Rails::Railtie

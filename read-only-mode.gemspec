Gem::Specification.new do |spec|
  spec.name = "read-only-mode"
  spec.version = "0.1.0"
  spec.authors = ["David Backeus"]
  spec.email = ["david.backeus@mynewsdesk.com"]
  spec.summary = "Simple read-only maintenance mode for Rails and Rack based web applications"
  spec.homepage = "https://github.com/reclaim-the-stack/read-only-mode"
  spec.license = "MIT"
  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "source_code_uri" => spec.homepage,
    "changelog_uri" => "#{spec.homepage}/blob/master/CHANGELOG.md"
  }
  spec.files = %w[README.md CHANGELOG.md read-only-mode.gemspec] + Dir["lib/**/*"]

  spec.required_ruby_version = ">= 2.7.0"
end

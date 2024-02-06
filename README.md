# Read Only Mode

A simple ruby gem for adding read only maintenance mode to your Rails / Rack applications.

When read only mode is enabled, all non GET / HEAD requests will be rejected with a 503 Service Unavailable response. Additionally the 503 response will be given in case a GET request would raise a `PG::ReadOnlySqlTransaction` error.

![screenshot](https://github.com/reclaim-the-stack/read-only-mode/blob/master/html-screenshot.png?raw=true)

## Installation

Add the line to your application's Gemfile:

```ruby
gem "read_only_mode"
```

## Usage

Read only mode is enabled via environment variables. There are two options, either:

Set `READ_ONLY_MODE=true`

Or...

Set `PGOPTIONS="-c default_transaction_read_only=on"` (or any other string containing `default_transaction_read_only=on`).

The `PGOPTIONS` approach is recommended for applications using Postgres as this will prevent any write queries from being executed.

### Rack integration

Rails applications will automatically use the middleware via a Railtie. For other Rack applications, you can add the middleware manually:

```ruby
use ReadOnlyMode::Middleware if ReadOnlyMode.enabled?
```

## Configuration

You can customize the HTML / JSON responses returned when read only mode is enabled via some simple setters:

```ruby
ReadOnlyMode.html_response = File.read("path/to/your/read_only.html")
ReadOnlyMode.json_response = { error: "Maintenance in progress" }.to_json
```

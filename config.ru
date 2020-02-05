require File.expand_path('config/environment', __dir__)
require 'ddtrace'

Datadog.configure do |c|
  c.use :rack
  c.use :grape
  c.tracer debug: true
end

use Datadog::Contrib::Rack::TraceMiddleware

run Acme::App.instance

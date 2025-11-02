# frozen_string_literal: true

App = Rack::Builder.new do
  use(Rack::Static, {
    urls: ["/"],
    root: "public",
    index: "index.html",
  })

  run ->(env) { 
    [404, {}, ["Not Found"]]
  }
end

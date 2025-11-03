# frozen_string_literal: true

App = Rack::Builder.new do
  map("/foo") do
    run ->(env) { [200, {}, ["reloading worked"]] } 
  end

  use(Rack::Static, {
    urls: ["/"],
    root: "public",
    index: "index.html",
  })

  run ->(env) { 
    [404, {}, ["Not Found"]]
  }
end

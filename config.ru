$LOAD_PATH.unshift(__dir__)

require "bundler/setup"
Bundler.require(:default, ENV.fetch("RACK_ENV", "development"))

require "lib/app"

run(App)


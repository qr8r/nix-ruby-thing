guard :process, name: "rack", command: "bundle exec rackup" do
  watch(%r{^(config|lib|app)/.*\.rb$})
  watch('config.ru')
end

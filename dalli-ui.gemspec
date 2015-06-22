$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dalli-ui"
  s.version     = "0.1.2"
  s.authors     = ["Pete Hawkins"]
  s.email       = ["pete@phawk.co.uk"]
  s.homepage    = "https://github.com/phawk/dalli-ui"
  s.summary     = "A web UI for Dalli"
  s.description = "Dalli UI is a mountable engine for Rails apps that displays information about your dalli (https://github.com/mperham/dalli) memcached instance and allows you to flush it from a web interface."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "readme.md", ".yardopts"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "dalli", "~> 2.7"
  s.add_dependency "hashie", "~> 3.4"

  s.add_development_dependency "redcarpet"
  s.add_development_dependency "github-markup"
  s.add_development_dependency "yard"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "minitest-rg"
  s.add_development_dependency "multi_json"
end

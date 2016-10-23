$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "api"
  s.version     = Api::VERSION
  s.authors     = ["Adam Hess"]
  s.email       = ["adamhess1991@gmail.com"]
  # s.homepage    = "TODO"
  s.summary     = "responds to text input"
  s.description = "responds to text input"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.rc1", "< 5.1"
  s.add_dependency 'responder'
  s.add_dependency 'sidekiq'
  s.add_development_dependency "sqlite3"
end

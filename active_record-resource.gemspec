$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_record/resource/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_record-resource"
  s.version     = ActiveRecord::Resource::VERSION
  s.authors     = ["Andre Helberg"]
  s.email       = ["helberg.andre@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ActiveRecord::Resource."
  s.description = "TODO: Description of ActiveRecord::Resource."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end

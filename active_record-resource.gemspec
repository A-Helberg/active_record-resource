$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_record/resource/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_record-resource"
  s.version     = ActiveRecord::Resource::VERSION
  s.authors     = ["Andre Helberg"]
  s.email       = ["helberg.andre@gmail.com"]
  s.homepage    = "https://github.com/A-Helberg/active_record-resource"
  s.summary     = "ActiveRecord::Resource implements a method for treating Models as Resources"
  s.description = "ActiveRecord::Resource implements a method for treating Models as Resources by creating Create, Update and Delete hooks in all models"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry-byebug"
end

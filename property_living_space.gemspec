$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "property_living_space/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "property_living_space"
  s.version     = PropertyLivingSpace::VERSION
  s.authors     = ["Kristian Mandrup"]
  s.email       = ["kmandrup@gmail.com"]
  s.homepage    = "http://www.danrent.dk"
  s.summary     = "LivingSpace for Property"
  s.description = "Details, Furnishment, Rooms, Shared, Size, Type concerns"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails',       '>= 3.2'

  s.add_dependency 'mongoid',     '>= 3.1'
  s.add_dependency 'sugar-high',  '~> 0.7.3'

  s.add_dependency 'hashie',        '>= 2.0'
  s.add_dependency 'concerned',     '>= 0.1.5'

  s.add_dependency 'rspec-rails', '>= 2.12'

  s.add_development_dependency 'rspec-rails', '>= 2.12'
end
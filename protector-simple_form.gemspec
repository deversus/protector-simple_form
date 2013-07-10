# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "protector/simple_form/version"

Gem::Specification.new do |s|
  s.name        = "protector-simple_form"
  s.version     = Protector::SimpleForm::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Francois Deschenes"]
  s.email       = ["fdeschenes@me.com"]
  s.summary     = "SimpleForm Protector"
  s.description = "Adds Protector support to SimpleForm associations."
  s.homepage    = "https://github.com/deversus/protector-simple_form"
  s.license     = "MIT"
  
  s.files         = Dir["LICENSE.txt", "README.md", "lib/**/*"]
  s.test_files    = Dir["test/**/*.rb"]
  s.require_paths = ["lib"]
  
  s.add_dependency "simple_form"
  s.add_dependency "protector", ">= 0.3.0"
  
  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
end

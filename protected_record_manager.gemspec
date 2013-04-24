$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "protected_record_manager/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "protected_record_manager"
  s.version     = ProtectedRecordManager::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ProtectedRecordManager."
  s.description = "TODO: Description of ProtectedRecordManager."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "protected_record"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
end

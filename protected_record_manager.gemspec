$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "protected_record_manager/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "protected_record_manager"
  s.version     = ProtectedRecordManager::VERSION
  s.authors     = ["Tad Hosford"]
  s.email       = ["tad.hosford@gmail.com"]
  s.homepage    = "http://github.com/rthbound/protected_record_manager"
  s.summary     = "Installs the protected_record gem and provides an interface for triaging ChangeRequest records"
  s.description = "Installs the protected_record gem and provides an interface for triaging ChangeRequest records"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "protected_record"
  # s.add_dependency "jquery-rails"
end

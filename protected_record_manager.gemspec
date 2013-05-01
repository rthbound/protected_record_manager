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
  s.description = "Installs the protected_record gem and provides an interface for triaging ChangeRequest records"
  s.summary     = %q{
                      This engine was created to provide the necessary migrations as well as a (very)
                      basic interface for triaging `ProtectedRecord::ChangeRequest::Record` objects.
                    }
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency             "rails",            ">= 3.0"
  s.add_dependency             "protected_record", "~> 0.1.0"
  s.add_development_dependency "pry"
end

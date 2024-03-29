# -*- encoding: utf-8 -*-
require File.expand_path('../lib/regexpgen/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bala Paranj"]
  gem.email         = ["bparanj@gmail.com"]
  gem.description   = %q{Ruby DSL to generate regular expressions}
  gem.summary       = %q{Regular expressions generator}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "regexpgen"
  gem.require_paths = ["lib"]
  gem.version       = Regexpgen::VERSION

  gem.add_development_dependency "rspec"
end

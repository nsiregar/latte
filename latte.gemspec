# frozen_string_literal: true

require 'English'

require File.expand_path('lib/latte/version', __dir__)

Gem::Specification.new do |gem|
  gem.authors       = ['Ngalim Siregar']
  gem.description   = 'get profile from codementor public url'
  gem.summary       = 'convert public codementor profile to json object'
  gem.homepage      = 'https://github.com/nsiregar/latte'
  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables   = ['latte']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'latte'
  gem.require_paths = ['lib']
  gem.version       = Latte::Spider::VERSION

  gem.license       = 'MIT'

  gem.add_dependency 'mechanize', '~> 2.9'

  gem.add_development_dependency 'rake', '~> 13.0'
  gem.add_development_dependency 'rspec', '~> 3.12'
end

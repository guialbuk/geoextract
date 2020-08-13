# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geoextract/version'

Gem::Specification.new do |spec|
  spec.name          = 'geoextract'
  spec.version       = Geoextract::VERSION
  spec.authors       = ['Gui Vieira']
  spec.email         = ['guialbuk@gmail.com']

  spec.summary       = 'Extracts geolocation data from images'
  spec.description   = 'Extracts geolocation data from images and outputs to CSV or HTML'
  spec.homepage      = 'https://github.com/guialbuk/geoextract'

  spec.metadata['allowed_push_host'] = 'Set to http://mygemserver.com when ready'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'bin'
  spec.executables   = ['geoextract']
  spec.require_paths = ['lib']

  spec.add_dependency 'mime-types'

  spec.add_development_dependency 'bundler',               '~> 2.0'
  spec.add_development_dependency 'exif',                  '~> 2.2'
  spec.add_development_dependency 'rake',                  '~> 13.0'
  spec.add_development_dependency 'rspec',                 '~> 3.8'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'
  spec.add_development_dependency 'rubocop',               '0.72.0'
  spec.add_development_dependency 'simplecov',             '~> 0.17.0'
end

# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'helpscout/mailbox/paths/version'

Gem::Specification.new do |spec|
  spec.name          = 'helpscout-mailbox-paths'
  spec.version       = Helpscout::Mailbox::Paths::VERSION
  spec.authors       = ['Jason Jacob']
  spec.email         = ['hipcog@gmail.com']

  spec.summary       = 'Simple mixin for generating helpscout paths with params'
  spec.homepage      = 'https://github.com/jayco/helpscout-mailbox-paths.git'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/jayco/helpscout-mailbox-paths.git'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

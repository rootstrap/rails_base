lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-base/constants'

Gem::Specification.new do |spec|
  spec.name          = 'rails-base'
  spec.version       = RailsBase::VERSION
  spec.authors       = ['fedeagripa']
  spec.email         = ['fagripa@toptierlabs.com']

  spec.summary       = 'All you need, all you wanted... and more'
  spec.description   = 'Rootstrap base engine'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org.
  # To allow pushes either set the 'allowed_push_host' to allow pushing
  # to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.files += Dir.glob('lib/**/*')

  spec.executables = ['rails_base']
  spec.require_paths = ['lib']

  spec.add_dependency 'tty-file', '~> 0.4.0'
  spec.add_dependency 'commander', '~> 4.4', '>= 4.4.3'
  spec.add_development_dependency 'bundler', '~> 1.9', '>=1.9.5'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rs-rails-base/constants'

Gem::Specification.new do |spec|
  spec.name          = 'rs-rails-base'
  spec.version       = RailsBase::VERSION
  spec.authors       = ['Rootstrap']
  spec.email         = ['info@rootstrap.com']

  spec.summary       = 'All you need, all you wanted... and more'
  spec.description   = 'Rootstrap base engine'
  spec.homepage      = "http://github.com/rootstrap/rails_base"
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.files += Dir.glob('lib/**/*')

  spec.executables = ['rs_rails_base']
  spec.require_paths = ['lib']

  spec.add_dependency 'tty-file', '~> 0.4.0'
  spec.add_dependency 'commander', '~> 4.4', '>= 4.4.3'
  spec.add_development_dependency 'bundler', '~> 1.9', '>=1.9.5'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

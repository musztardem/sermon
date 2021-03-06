# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sermon/version'
require 'pry'

Gem::Specification.new do |spec|
  spec.name          = 'sermon'
  spec.version       = Sermon::VERSION
  spec.authors       = ['Antoni Pstraś']
  spec.email         = ['antek.pstras@gmail.com']

  spec.summary       = 'Simple server monitoring'
  spec.description   = 'Simple tool for monitoring server resources and sending notifications'
  spec.homepage      = 'https://github.com/musztardem/sermon'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = 'sermon'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10.4'
  spec.add_development_dependency 'factory_girl', '~> 4.8', '>= 4.8.0'
  spec.add_development_dependency 'rubocop', '~> 0.42.0'
  spec.add_dependency 'slack-notifier', '~> 1.5'
  spec.add_dependency 'mail', '~> 2.6'
  spec.add_runtime_dependency 'net-ping', '~> 2.0', '>= 2.0.1'
  spec.add_dependency 'vmstat', '~> 2.1'
  spec.add_dependency 'colorize', '~> 0.8.1'
end

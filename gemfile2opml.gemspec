# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gemfile2opml/version'

Gem::Specification.new do |spec|
  spec.name          = "gemfile2opml"
  spec.version       = Gemfile2opml::VERSION
  spec.authors       = ["hitode909"]
  spec.email         = ["hitode909@gmail.com"]

  spec.summary       = %q{Generate OPML from Gemfile}
  spec.description   = %q{gemfile2opml is a command line tool which generates OPML from Gemfile. You can subscribe libraries' update on your favorite feed reader.}
  spec.homepage      = "https://github.com/hitode909/gemfile2opml"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gemnasium-parser", "~> 0.1.9"
  spec.add_dependency "nokogiri", "~> 1.6.6.2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "BestFriendFinder"
  spec.version       = BestFriendFinder::VERSION
  spec.authors       = ["'Alexis Dorn'"]
  spec.email         = ["'alexisadorn@gmail.com'"]

  spec.summary       = %q{A list of animals available for adoption.}
  spec.description   = %q{CLI app that scrapes information and returns a list of animals available for adoption
                          and their details from the Best Friends Animal Society sanctuary in Utah. http://bestfriends.org/}
  spec.homepage      = "https://github.com/alexisadorn/BestFriendFinder-cli-app"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = ["bestfriendfinder"]#spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "colorize", "~> 0.8.1"
end

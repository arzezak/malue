lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "malue/version"

Gem::Specification.new do |spec|
  spec.name          = "malue"
  spec.version       = Malue::VERSION
  spec.authors       = ["Ariel Rzezak"]
  spec.email         = ["arzezak@gmail.com"]
  spec.summary       = "Query MercadoLibre's products prices."
  spec.description   = "Find out the selling price for a given product in ML."
  spec.homepage      = "https://github.com/arzezak/malue"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry", "~> 0.12.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 5.0"
  spec.add_development_dependency "webmock", "~> 3.7", ">= 3.7.6"
end

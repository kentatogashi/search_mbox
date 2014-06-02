# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'search_mbox/version'

Gem::Specification.new do |spec|
  spec.name          = "search_mbox"
  spec.version       = SearchMbox::VERSION
  spec.authors       = ["kenta.togashi"]
  spec.email         = ["kenta_togasi@yahoo.co.jp"]
  spec.summary       = %q{ Search mails from mbox simply }
  spec.description   = %q{You set condition, and you can get the mail to satisfy the conditions}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "net/imap"
  spec.add_development_dependency "kconv"
end

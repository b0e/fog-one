# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fog/one/version"

Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name              = "fog-one"
  s.version           = Fog::One::VERSION

  s.summary     = "Module for Fog to support OpenNebula as additional Provider among others"
  s.description = "This library can be used as a module for 'fog' or as standalone OpenNebula provider."

  s.authors  = ["Netways Managed Services GmbH"]
  s.email    = "info@netways.de."
  s.homepage = "http://github.com/netways/fog-one"
  s.license  = "MIT"

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md]

  s.add_dependency("xmlrpc") if RUBY_VERSION > "2.4.0"
  s.add_dependency("fog-core")
  s.add_dependency("fog-json")
  s.add_dependency("fog-xml")
  s.add_dependency("opennebula", "~> 4.12.0")

  s.add_development_dependency("minitest")
  s.add_development_dependency("minitest-stub-const")
  s.add_development_dependency("rake")
  s.add_development_dependency("shindo", "~> 0.3.4")
  s.add_development_dependency("simplecov")
  s.add_development_dependency("mocha", "~> 1.1.0")

  # Let's not ship dot files and gemfiles
  git_files = `git ls-files`.split("\n")
  s.files = git_files.delete_if{ |f| f =~ /^\..*/ || f =~ /^gemfiles\/*/ }
  s.test_files = `git ls-files -- {spec,tests}/*`.split("\n")
end

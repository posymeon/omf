# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omf_ec/version"

Gem::Specification.new do |s|
  s.name        = "omf_ec"
  s.version     = OmfEc::VERSION
  s.authors     = ["NICTA"]
  s.email       = ["omf-user@lists.nicta.com.au"]
  s.homepage    = "https://www.mytestbed.net"
  s.summary     = %q{OMF experiment controller}
  s.description = %q{Experiment controller of OMF, a generic framework for controlling and managing networking testbeds.}

  s.rubyforge_project = "omf_ec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  #s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.executables   = ["omf_pre"]
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "minitest", "~> 3.2"
  s.add_runtime_dependency "omf_common", "~> 6.0.0.pre"
  s.add_runtime_dependency "gli", "~> 2.4.1"
end

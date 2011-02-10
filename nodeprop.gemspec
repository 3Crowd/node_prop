$:.unshift(File.join(File.dirname(__FILE__),'lib')) unless $:.member?(File.join(File.dirname(__FILE__),'lib'))
require 'node_prop/version'

Gem::Specification.new do |s|
  s.name	= 'node_prop'
  s.version	= NodeProp::Version.to_standard_format
  s.authors	= ["Justin Lynn (justinlynn)", "3Crowd Technologies, Inc. (Sponsor)"]
  s.email	= ["ops@3crowd.com"]
  s.homepage	= "http://github.com/3Crowd/nodeprop"
  s.summary	= "A unified and arbitrary graph manipulation interface"
  s.description = "A unified and arbitrary graph manipulation interface"

  s.required_rubygems_version = ">= 1.5.0"

  s.files	= Dir.glob("{bin,lib}/**/*") + %w(LICENSE.md README.md CHANGELOG.md)
  s.executables = Dir.glob("{bin}/*")
  s.require_path= 'lib'

end

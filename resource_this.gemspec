spec = Gem::Specification.new do |s|
  s.name     = 'resource_this'
  s.version  = '1.0.0'
  s.summary  = "Not scaffolding. Resourcing. Creates extremely customizable resource controllers with one line of code."
  s.description = %{Not scaffolding. Resourcing. Creates extremely customizable resource controllers with one line of code.

  class PostsController < ActionController::Base
   resource_this
  end}
  s.authors  = ["Hsiu-Fan Wang", "Jesse Newland"]
  s.email    = "hfwang@porkbuns.net"
  s.homepage = "https://github.com/hfwang/resource_this"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]


  s.add_runtime_dependency "rails", "~> 3.2"

  s.add_development_dependency "rspec", "~> 2.4"
  s.add_development_dependency "rubygems-tasks", "~> 0.2"
  s.add_development_dependency "yard", "~> 0.8"
end

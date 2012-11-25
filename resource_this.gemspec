spec = Gem::Specification.new do |s|
  s.name = 'resource_this'
  s.version = '1.0.0'
  s.summary = "Not scaffolding. Resourcing. Creates extremely customizable resource controllers with one line of code."
  s.description = %{Not scaffolding. Resourcing. Creates extremely customizable resource controllers with one line of code.

  class PostsController < ActionController::Base
   resource_this
  end}
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb']
  s.require_paths = ["lib"]
  # s.autorequire = 'builder'
  # s.has_rdoc = true
  # s.extra_rdoc_files = Dir['[A-Z]*']
  # s.rdoc_options << '--title' <<  'Builder -- Easy XML Building'
  s.authors = ["Jesse Newland", "Hsiu-Fan Wang"]
  s.email = "hfwang@porkbuns.net"
  s.homepage = "https://github.com/hfwang/resource_this"
end

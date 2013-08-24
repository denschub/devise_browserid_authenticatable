Gem::Specification.new do |s|
  s.name         = 'devise_browserid_authenticatable'
  s.summary      = 'BrowserID/Persona authentication for Devise 2+'
  s.description  = 'Mozilla BrowserID/Persona authentication module that works with Rails 3.1+ and Devise 2.1+'
  s.license      = 'MIT'

  s.authors      = ['Dennis Schubert']
  s.email        = 'gems@schub.io'
  s.homepage     = 'https://github.com/denschub/devise_browserid_authenticatable'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = %w(lib)

  s.version       = '1.3.2'

  s.add_dependency 'devise', '>= 2.1'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'rake'
end

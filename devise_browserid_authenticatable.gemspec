Gem::Specification.new do |s|
  s.name         = "devise_browserid_authenticatable"
  s.summary      = "BrowserID/Persona authentication for Devise"
  s.description  = "Mozilla BrowserID/Persona authentication module for Devise"

  s.authors      = ["Dennis Schubert"]
  s.email        = "gems@schub.io"
  s.homepage     = "https://github.com/denschub/devise_browserid_authenticatable"

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.version       = "1.1.0"
  
  s.add_dependency "devise", "~> 2.1"
end
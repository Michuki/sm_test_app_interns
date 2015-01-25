# -*- encoding: utf-8 -*-
# stub: timezone 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "timezone"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Pan Thomakos"]
  s.date = "2013-10-21"
  s.description = "A simple way to get accurate current and historical timezone information based on zone or latitude and longitude coordinates. This gem uses the tz database (http://www.twinsun.com/tz/tz-link.htm) for historical timezone information. It also uses the geonames API for timezone latitude and longitude lookup (http://www.geonames.org/export/web-services.html)."
  s.email = ["pan.thomakos@gmail.com"]
  s.extra_rdoc_files = ["README.markdown", "License.txt"]
  s.files = ["License.txt", "README.markdown"]
  s.homepage = "http://github.com/panthomakos/timezone"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = "timezone"
  s.rubygems_version = "2.2.2"
  s.summary = "timezone-0.3.1"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 4.0"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 4.0"])
      s.add_dependency(%q<timecop>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 4.0"])
    s.add_dependency(%q<timecop>, [">= 0"])
  end
end

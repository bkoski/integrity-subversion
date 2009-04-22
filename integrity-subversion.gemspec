# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{integrity-subversion}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Koski"]
  s.date = %q{2009-04-22}
  s.description = %q{Bundled subversion support for integrity}
  s.email = %q{gems@benkoski.com}
  s.files = ["lib/integrity", "lib/integrity_subversion.rb", "lib/integrity/scm", "lib/integrity/scm.rb", "lib/integrity/scm/git.rb", "lib/integrity/scm/subversion", "lib/integrity/scm/subversion.rb", "lib/integrity/scm/subversion/uri.rb", "README", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bkoski/integrity-subversion}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Bundled subversion support for integrity}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<integrity>, [">= 0"])
      s.add_runtime_dependency(%q<thor>, [">= 0"])
    else
      s.add_dependency(%q<integrity>, [">= 0"])
      s.add_dependency(%q<thor>, [">= 0"])
    end
  else
    s.add_dependency(%q<integrity>, [">= 0"])
    s.add_dependency(%q<thor>, [">= 0"])
  end
end

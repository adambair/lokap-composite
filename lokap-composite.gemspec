# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name    = "lokap-composite"
  spec.version = "0.0.4"

  spec.authors = ["Adam Bair"]
  spec.email   = ["adambair@gmail.com"]

  spec.licenses = "Nonstandard"
  spec.summary  = "A minimal composite pattern; got sick of rewriting it."
  spec.homepage = "https://github.com/adambair/lokap-composite"

  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["source_code_uri"]   = "https://github.com/adambair/lokap-composite/"
  spec.metadata["changelog_uri"]     = "https://github.com/adambair/lokap-composite/blob/master/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"]   = "https://github.com/adambair/lokap-composite/issues"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.require_paths = ["lib"]
end


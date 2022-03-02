# frozen_string_literal: true

require_relative "lib/req_ruby_version/version"

Gem::Specification.new do |spec|
  spec.name = "req_ruby_version"
  spec.version = ReqRubyVersion::VERSION
  spec.authors = ["Jarek Prokop"]
  spec.email = ["jprokop@redhat.com"]

  spec.summary = "RubyGems does not print nice error when required_ruby_version is not satisfied"
  spec.homepage = "https://www.github.com/jackorp/req_ruby_version"
  spec.license = "MIT"
  spec.required_ruby_version = [">= 2.6.0", "< 3.1"]

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

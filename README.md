# ReqRubyVersion

This is a reproducer to showcase the RubyGems exception when used Ruby version does not satisfy the gemspec's specified required ruby version.

## Reproduce the problem

Build the gem

    $ gem build req_ruby_version.gemspec

And then install on Ruby version lower that Ruby 3.1:

    $ gem install ./req_ruby_version-0.1.0.gem

Verify installation by executing the binary that was installed.

    $ req_ruby_version

This command should print `Hello!` at this point.


Use Ruby >= 3.1 and execute the gem's executable

    $ req_ruby_version

This prints a confusing exception:
```
/usr/share/rubygems/rubygems/resolver/conflict.rb:47:in `conflicting_dependencies': undefined method `request' for nil:NilClass (NoMethodError)

    [@failed_dep.dependency, @activated.request.dependency]
                                       ^^^^^^^^
	from /usr/share/rubygems/rubygems/exceptions.rb:61:in `conflicting_dependencies'
	from /usr/share/rubygems/rubygems/exceptions.rb:55:in `initialize'
	from /usr/share/rubygems/rubygems/resolver.rb:193:in `exception'
	from /usr/share/rubygems/rubygems/resolver.rb:193:in `raise'
	from /usr/share/rubygems/rubygems/resolver.rb:193:in `rescue in resolve'
	from /usr/share/rubygems/rubygems/resolver.rb:191:in `resolve'
	from /usr/share/rubygems/rubygems/request_set.rb:411:in `resolve'
	from /usr/share/rubygems/rubygems/request_set.rb:423:in `resolve_current'
	from /usr/share/rubygems/rubygems.rb:230:in `finish_resolve'
	from /usr/share/rubygems/rubygems.rb:287:in `block in activate_bin_path'
	from /usr/share/rubygems/rubygems.rb:285:in `synchronize'
	from /usr/share/rubygems/rubygems.rb:285:in `activate_bin_path'
	from /usr/local/bin/req_ruby_version:23:in `<main>'
/usr/share/rubygems/rubygems/resolver/molinillo/lib/molinillo/resolution.rb:317:in `raise_error_unless_state': Unable to satisfy the following requirements: (Gem::Resolver::Molinillo::VersionConflict)

- `req_ruby_version (= 0.1.0)` required by `user-specified dependency`
	from /usr/share/rubygems/rubygems/resolver/molinillo/lib/molinillo/resolution.rb:299:in `block in unwind_for_conflict'
	from <internal:kernel>:90:in `tap'
	from /usr/share/rubygems/rubygems/resolver/molinillo/lib/molinillo/resolution.rb:297:in `unwind_for_conflict'
	from /usr/share/rubygems/rubygems/resolver/molinillo/lib/molinillo/resolution.rb:682:in `attempt_to_activate'
	from /usr/share/rubygems/rubygems/resolver/molinillo/lib/molinillo/resolution.rb:254:in `process_topmost_state'
	from /usr/share/rubygems/rubygems/resolver/molinillo/lib/molinillo/resolution.rb:182:in `resolve'
	from /usr/share/rubygems/rubygems/resolver/molinillo/lib/molinillo/resolver.rb:43:in `resolve'
	from /usr/share/rubygems/rubygems/resolver.rb:190:in `resolve'
	from /usr/share/rubygems/rubygems/request_set.rb:411:in `resolve'
	from /usr/share/rubygems/rubygems/request_set.rb:423:in `resolve_current'
	from /usr/share/rubygems/rubygems.rb:230:in `finish_resolve'
	from /usr/share/rubygems/rubygems.rb:287:in `block in activate_bin_path'
	from /usr/share/rubygems/rubygems.rb:285:in `synchronize'
	from /usr/share/rubygems/rubygems.rb:285:in `activate_bin_path'
	from /usr/local/bin/req_ruby_version:23:in `<main>'
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

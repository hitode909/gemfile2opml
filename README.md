# Gemfile2opml

Gemfile2opml generates OPML from Gemfile or gemspec.
This is useful for subscribe your depending libraries.

## Installation

Gemfile2opml is a command-line tool.

```
% gem install gemfile2opml
```

## Usage

```
% gemfile2opml PATH_TO_GEMFILE > a.opml
```

or,

```
% gemfile2opml PATH_TO_GEMSPEC > a.opml
```

Then, subscribe OPML file with your favorite feed reader.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hitode909/gemfile2opml.


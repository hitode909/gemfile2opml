require "gemfile2opml/version"
require "gemfile2opml/converter"

module Gemfile2opml
  def self.run(stdout, argv)
    converter = Gemfile2opml::Converter.new
    target_file = argv.first
    stdout.puts converter.convert(target_file)
  end
end

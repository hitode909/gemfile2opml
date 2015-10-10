require 'gemnasium/parser'
require 'nokogiri'

class Gemfile2opml::Converter
  def convert(file)

    gemfile = Gemnasium::Parser.gemfile(open(file).read)

    gemspec = Gemnasium::Parser.gemspec(open(file).read)

    dependencies = [*gemfile.dependencies, *gemspec.dependencies]

    targets = generate_targets(dependencies)

    opml = Nokogiri::XML::Builder.new {|xml|
      xml.opml(:version => '2.0') {
        xml.head {|head|
          head.title generate_title(file)
        }
        xml.body {|body|
          targets.keys.map {|target|#string
            body.outline(title: target) {|outline|
              targets[target].uniq.sort.map {|name|#string
                outline.outline(
                  title: name,
                  htmlUrl: "https://rubygems.org/gems/#{name}",
                  xmlUrl: "https://rubygems.org/gems/#{name}/versions.atom",
                )
              }
            }
          }
        }
      }
    }

    opml.to_xml
  end

  def generate_title(file)
    application = File.basename File.dirname File.expand_path file
    filename = File.basename file
    "#{application}/#{filename}"
  end

  def generate_targets(dependencies)
    targets = {}

    dependencies.each{|dependency|
      targets[dependency.type] ||= []
      targets[dependency.type] << dependency.name
    }

    targets
  end
end

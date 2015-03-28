# ThreatExpert

The threatexpert gem provides a simple API to query ThreatExpert by malware name (to receive a list of matching hashes) or hash (to receive a malware report).  This also provides a simple upload feature.

## Installation

Add this line to your application's Gemfile:

    gem 'threatexpert'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install threatexpert

## Usage

  require 'threatexpert'
  t = ThreatExpert::Search.new
  hashes = t.name("Worm.Hamweg.Gen")
  html = t.md5(hashes[0])
  sb = ThreatExpert::Submit.new
  filename = "/malware_share/downadup/62c6c217e7980e53aa3b234e19a5a25e.dll"
  sb.submit(filename, youremailhere)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/threatexpert/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

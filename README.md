# Geoextract 

[![CircleCI](https://circleci.com/gh/guialbuk/geoextract.svg?style=svg)](https://circleci.com/gh/guialbuk/geoextract)

Welcome to `geoextract`! This tool ecursively extracts EXIF GPS data from images and outputs to CSV and HTML

## Installation

1. geoextract` uses the `exif` gem written in C, which depends on `libexif`. To install `libexif`: 

```bash
brew install libexif             # Homebrew
sudo apt-get install libexif-dev # APT
sudo yum install libexif-devel   # CentOS
 ```
[source](https://github.com/tonytonyjan/exif#installation)


2. To install this gem onto your local machine, run:

```bash
bundle exec rake install
```

## Usage

```bash
Usage: geoextract [options]
    -f, --format [FORMAT]            Output format [csv|html]
                                     Default: csv
    -d, --directory [DIRECTORY]      Directory to recursively search for images
                                     Default: current directory
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

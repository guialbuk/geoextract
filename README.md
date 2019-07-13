# Geoextract 

[![CircleCI](https://circleci.com/gh/guialbuk/geoextract.svg?style=svg)](https://circleci.com/gh/guialbuk/geoextract)

Welcome to `geoextract`! This tool recursively extracts EXIF GPS data from images and outputs to CSV and HTML

## Installation

1. `geoextract` uses the `exif`, a gem written in C that depends on `libexif`. To install `libexif`: 

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

If you are using `rbenv`, you might need to run `rbenv rehash` as well.

## Usage

```bash
Usage: geoextract [options]
    -f, --format [FORMAT]            Output format [csv|html]
                                     Default: csv
    -d, --directory [DIRECTORY]      Directory to recursively search for images
                                     Default: current directory
```

`geoextract` is a UNIX-style tool, so it outputs to `stdout` do you can grep it or redirect the output to files.

Prints GPS data in CSV format for images in the current directory and all subdirectories:
```bash
  geoextract
```

Writes the CSV output into a file:
```bash
  geoextract > output.csv
```

Writes the HTML output into a file:
```bash
  geoextract --format html > output.html
```

Extracts data from images in the storage directory and its subdirectories:
```bash
  geoextract --directory storage
```

## Implementation details
  - Displays the image path and the main GPS data first
  - Detects images by MIME-type
  - Handles images without EXIF data
  - Converts data written in `Rational` numbers to more user-friendly formats.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

You can open the code coverage report by running `open coverage/index.html`.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

# BestsellingBooksByGenre

This gem application scrapes data from the NY Times Bestsellers list based on user input.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bestselling_books_by_genre'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bestselling_books_by_genre

## Usage

Run bin/bestselling_books and the user will be prompted to input a book genre (fiction/nonfiction). Enter input accordingly and the program will present a list of that genre's current top five bestselling book titles along with their author names. The user will then be prompted to either exit or input the number of the book they would like more information about.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'bkhartmire'/bestselling_books_by_genre.

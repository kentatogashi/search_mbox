# SearchMbox

You can easily search mail to satisfy conditions.

## Installation

Add this line to your application's Gemfile:

    gem 'search_mbox'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install search_mbox

## Usage

##### Default
```ruby
host="example.com"
account="hoge@example.com"
passwd="hoge1234"
SearchMbox.login(host, account, passwd)
mails = SearchMbox.search()
puts mails
```
##### Conditional search
```ruby
host="example.com"
account="hoge@example.com"
passwd="hoge1234"
SearchMbox.login(host, account, passwd)
mails = SearchMbox.search(["From", "hoge@example.com"])
puts mails
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/search_mbox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

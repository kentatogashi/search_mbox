$:.unshift('.')
require 'search_mbox'
include SearchMbox

SearchMbox.login('example.com', 'togashik@hoge@example.com', 'hogehoge')
mails = SearchMbox.search
mails.each do |m|
    puts m[:msg_id]
    puts m[:date]
    puts m[:from]
    puts m[:subject]
    puts m[:body]
end

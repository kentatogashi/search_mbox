require "search_mbox/version"
require "net/imap"
require "kconv"

module SearchMbox
     def self.login(host, account, passwd, port = 143, imap_usessl = false)
         @date_attr_name = 'INTERNALDATE'
         @envelope_attr_name = 'ENVELOPE'
         @subject_attr_name = 'BODY[HEADER.FIELDS (SUBJECT)]'
         @body_attr_name = 'BODY[TEXT]'
         @imap_port = port
         @imap_usessl = imap_usessl
         begin
             @imap = Net::IMAP.new(host, @imap_port, @imap_usessl)
             @imap.login(account, passwd)
         rescue => e
             STDERR.puts "[ERROR] #{e}"
             exit 1
         end
     end
      
     def self.search(rule = nil)
         rule = ['ALL'] if rule.nil?
         @mails = Array.new
         @imap.examine('INBOX')
         @imap.search(rule).each do |msg_id|
             @mail = Hash.new
             msg = @imap.fetch(msg_id, 
                               [
                                   @date_attr_name,
                                   @envelope_attr_name, 
                                   @subject_attr_name, 
                                   @body_attr_name
             ]).first
             date = msg.attr[@date_attr_name]
             envelope = msg.attr[@envelope_attr_name].from[0]
             subject = msg.attr[@subject_attr_name].toutf8.strip
             body = msg.attr[@body_attr_name].toutf8.strip
             @mail[:msg_id] = msg_id
             @mail[:date] = date
             @mail[:from] = envelope[:mailbox] + '@' + envelope[:host]
             @mail[:subject] = subject
             @mail[:body] = body
             @mails.push(@mail)
         end
         return @mails
     end
      
     def self.delete_all
         @imap.select('INBOX')
         @imap.search(['ALL']).each do |msg_id|
             @imap.store(msg_id, "+FLAGS", [:Deleted])
         end
         @imap.expunge
     end
      
     def self.logout
         @imap.logout
     end
end

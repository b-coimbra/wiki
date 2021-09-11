require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <someone@hotmail.com>
To: A Test User <send-to@hotmail.com>
Subject: SMTP Ruby mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message, 'send@hotmail.com',
                             'receiver@hotmail.com'
end

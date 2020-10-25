require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@mail.com>
To: Test user <test@user.com>
Subject: SMPT e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
    smtp.send_message message, 'me@mail.com', 'test@user.com'
end

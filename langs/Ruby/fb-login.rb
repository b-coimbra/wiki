require 'mechanize'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

mech = Mechanize.new
mech.get('http://facebook.com/') do |page|
  login = page.form_with(:action => '/login.php?') do |f|
    f.email = ARGV[1]
    f.pass  = ARGV[2]
  end.click_button

  login.links.each do |link|
    text = link.text.strip
    next unless text.length > 0
    puts text
  end
end
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => "587",
	:domain => "gmail.com",
	:user_name => "ecsproblemreportstest@gmail.com",
	:password => "abcabc123",
	:authentication => "plain",
	:enable_starttls_auto => true
}
Mailman.config.pop3 = {
  :username => 'ecsproblemreportstest@gmail.com',
  :password => 'abcabc123',
  :server   => 'pop.gmail.com',
  :port     => 995, # defaults to 110
  :ssl      => true # defaults to false
}
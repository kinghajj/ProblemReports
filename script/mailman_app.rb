# mailman_app.rb
require 'mailman'

Mailman.config.maildir = '~/Maildir'

Mailman::Application.run do
  default do

  end
end
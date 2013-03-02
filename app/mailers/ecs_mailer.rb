class EcsMailer < ActionMailer::Base
  default from: "ecsproblemreportstest@gmail.com"

  def start_email(ticket,user)
  	@ticketId = ticket.id
  	@ticketSubject = ticket.subject
  	@userName = user.user_name
  	@startTime = DateTime.now
  	@submitterEmail = ticket.submitters_email

  	mail(:to => @submitterEmail,:subject => "Ticket #{@ticketSubject} has been started.")

  end
end

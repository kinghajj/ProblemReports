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
  def send_email(user,recipient,ticket,message,files)
  	@message = message
  	@signature = user.email_signature
    @ticket = ticket

    if(!files.nil?)
      files.each do |f|
          attachments[f.original_filename] = f.read
      end
    end
     
  	mail(:to => recipient, :subject => "Message about #{ticket.subject}.")

  	emailRecord = ProblemReportEmail.new(:from_user_id => user.id, :to_address => recipient, :message => @message, :problem_report_record_id => ticket.id)
  	emailRecord.save
  end
end

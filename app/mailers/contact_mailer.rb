class ContactMailer < ApplicationMailer
  default to: ENV["EMAIL"]


  def submit(details)
    @details = details
    subject = details.subject || "Question from #{details.name}"

    mail(from: details.email, subject: subject)
  end
end

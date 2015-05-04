class RejectionMailer < ActionMailer::Base

  def no_email_address(email, message_id)
    @email = email
    mail(
      from: "#{EMAIL_NAME} no-reply <no-reply@#{EMAIL_HOST}> ",
      to: email,
      subject: 'Brak twojego adresu e-mail w naszej bazie klientów'
    )
    headers['In-Reply-To'] = message_id
  end

  def incorrect_recipient(email, message_id)
    @email = email
    mail(
      from: "#{EMAIL_NAME} no-reply <no-reply@#{EMAIL_HOST}> ",
      to: email,
      subject: 'Niepoprawny odbiorca'
    )
    headers['In-Reply-To'] = message_id
  end
end

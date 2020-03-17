class ServiceReminderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(car)
    @car = car
    @url = 'http://wykop.pl'

    mail(to: @car.email, subject: 'Przypomnienie o przeglądzie')
  end
end

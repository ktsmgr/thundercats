class Notifier < ActionMailer::Base
  default from: "no-reply@thundercats.com"
  #use the email address that will send the email

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_confirmation_email.subject
  #
  def order_confirmation_email(customer)
    @customer = customer
    #to make this an instance variable

    mail to: @customer.email
  end
end

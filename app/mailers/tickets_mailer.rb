class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to:user.email, subject: 'You are buying ticket')
  end

  def cancel_buy_ticket(user)
    @user = user
    mail(to:user.email, subject: 'Cancel a ticket')
  end
end

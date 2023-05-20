class UserMailer < ApplicationMailer
  def loan_email(loan_email)
    @title = loan_email.book.title
    @date = loan_email.due_date

    mail(to: loan_email.user.email, subject: 'Return the book')
  end
end

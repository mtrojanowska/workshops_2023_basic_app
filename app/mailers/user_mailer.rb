class UserMailer < ApplicationMailer
  def notification_email(book_loan)
    @title = book_loan.book.title
    @date = book_loan.due_date

    mail(to: book_loan.user.email, subject: 'Return the book')
  end
end

class LoanEmailJob
  include Sidekiq::Job

  def perform(book_loan_id)
    book_loan = BookLoan.find(book_loan_id)
    UserMailer.loan_email(book_loan).deliver_now
  end
end

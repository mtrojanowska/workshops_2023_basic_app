class NotificationJob
  include Sidekiq::Job

  def perform
    BookLoan.where(status: 'checked_out', due_date: Date.tomorrow).each do |book_loan|
      UserMailer.notification_email(book_loan).deliver_later
    end
  end
end

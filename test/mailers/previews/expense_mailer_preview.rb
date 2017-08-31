# Preview all emails at http://localhost:3000/rails/mailers/expense_mailer
class ExpenseMailerPreview < ActionMailer::Preview
    def expense_alert
        ExpenseMailer.expense_alert(Expense.first)
    end
end

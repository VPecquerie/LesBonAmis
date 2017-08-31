# Preview all emails at http://localhost:3000/rails/mailers/expense_mailer
class ExpenseMailerPreview < ActionMailer::Preview
    def expense_alert
        ExpenseMailer.expense_alert(Expense.last)
    end

    def expense_contest
        ExpenseMailer.expense_contest(Expense.last, User.first)
    end
end
class ExpenseMailer < ApplicationMailer
    def expense_alert(expense)
        @expense = expense
        for beneficiary in expense.beneficiaries
            mail(to: beneficiary.email, subject: expense.title)
        end
    end

    def expense_contest(expense, user)
        @expense = expense
        @user = user
        mail(to: expense.user.email, subject: expense.title)
    end
end

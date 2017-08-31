class ExpenseMailer < ApplicationMailer
    def expense_alert(expense)
        @expense = expense
        for beneficiary in expense.beneficiaries
            mail(to: beneficiary.email, subject: expense.title)
        end
    end
end

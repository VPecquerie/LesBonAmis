class HomeController < ApplicationController

  def index
    if !@current_user
      redirect_to login_path
      return
    end

    @user = User.find(@current_user.id)
    @expenses = @user.expenses

    @user_spent = Money.new(0)
    @users_debtor = Money.new(0)

    @expenses.each do |expense|
      @number_of_users = expense.users.count
      @user_expense = expense.amount_money / @number_of_users

      if expense.user_id == @user.id
        @user_spent += @user_expense * (@number_of_users - 1)
      else
        @users_debtor += @user_expense
      end
    end

    @global_user = @user_spent - @users_debtor
  end
end

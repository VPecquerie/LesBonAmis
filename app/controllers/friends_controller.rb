class FriendsController < ApplicationController

  def index
    if !@current_user
      redirect_to login_path
    end

    @users = User.all
  end

  def show
    if !@current_user
      redirect_to login_path
    end

    @friend = User.find(params[:id])

    @expenses_user = Expense
                         .joins(:users)
                         .where('expenses.user_id = (?)', @current_user.id)
                         .where('users.id = (?)', params[:id])

    @expenses_friend = Expense
                           .joins(:users)
                           .where('expenses.user_id = (?)', params[:id])
                           .where('users.id = (?)', @current_user.id)

    @expenses = @expenses_user + @expenses_friend

    @user_spent = 0
    @user_debtor = 0

    @expenses.each do |expense|
      @number_of_users = expense.users.count
      @final_expense = (expense.amount_cents / @number_of_users) * (@number_of_users - 1)

      if expense.user_id == @current_user.id
        @user_spent += @final_expense
      elsif expense.user_id == @friend.id
        @user_debtor += @final_expense
      end
    end

    @global_user = @user_spent - @user_debtor
  end
end

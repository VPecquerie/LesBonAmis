class FriendsController < ApplicationController

  def index
    if !@current_user
      redirect_to login_path
      return
    end

    @users = User.all
  end

  def show
    if !@current_user
      redirect_to login_path
      return
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

    @user_spent = Money.new(0)
    @user_debtor = Money.new(0)

    @expenses.each do |expense|
      @number_of_users = expense.users.count
      @user_expense = expense.amount / @number_of_users

      if expense.user_id == @current_user.id
        @user_spent += @user_expense * (@number_of_users - 1)
      else
        @user_debtor += @user_expense
      end
    end

    @global_user = @user_spent - @user_debtor
  end
end

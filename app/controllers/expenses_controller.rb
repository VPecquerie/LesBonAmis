class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    if !@current_user
      redirect_to login_path
    end

    @expenses = Expense.all
    @users = User.all
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    if !@current_user
      redirect_to login_path
    end
  end

  # GET /expenses/new
  def new
    if !@current_user
      redirect_to login_path
    end

    @expense = Expense.new
    @users = User.all
  end

  # GET /expenses/1/edit
  def edit
    if !@current_user
      redirect_to login_path
    end

    @users = User.all
  end

  # POST /expenses
  # POST /expenses.json
  def create
    if !@current_user
      redirect_to login_path
    end

    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { redirect_to :new_expense }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    if !@current_user
      redirect_to login_path
    end

    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    if !@current_user
      redirect_to login_path
    end

    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /expenses/global
  def global
    if !@current_user
      redirect_to login_path
    end

    @user = User.find(@current_user.id)
    @expenses = @user.expenses

    @user_spent = 0
    @users_debtor = 0

    @expenses.each do |expense|
      @number_of_users = expense.users.count
      @final_expense = (expense.amount_cents / @number_of_users) * (@number_of_users - 1)

      if expense.user_id == @user.id
        @user_spent += @final_expense
      else
        @users_debtor += @final_expense
      end
    end

    @global_user = @user_spent - @users_debtor
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:title, :amount_cents, :user_id, user_ids: [])
    end
end

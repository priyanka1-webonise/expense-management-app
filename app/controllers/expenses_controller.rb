class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
    @users = User.all
  end

  def create
    params[:expense][:user_id]= current_user.id unless params[:expense][:group_id].present?
  	@expense = Expense.new(expense_params)
  	if @expense.save
      if params[:expense][:group_id].present?
	      redirect_to request.referer
      else
        redirect_to expenses_path
      end
  	else
  	  render 'new'	
  	end		
  end	

  def index
    @expenses = current_user.expenses
    @groups = current_user.groups
  end

  private
  def expense_params
  	params.require(:expense).permit(:description,:amount, :paid_by, :group_id, :user_id)
  end	
end

class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
    @users = User.all
  end

  def create
  	@expense = Expense.new(expense_params)
  	if @expense.save
	  redirect_to request.referer
  	else
  	  render 'new'	
  	end		
  end	

  def index
    @groups = current_user.groups
  end

  private
  def expense_params
  	params.require(:expense).permit(:description,:amount, :paid_by, :group_id)
  end	
end

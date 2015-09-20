module ApplicationHelper
	def paid_by(expense)
		if expense.paid_by.to_i == current_user.id
			expense.amount.to_s + " You paid for yourself"
		else
			"You will get " + expense.amount.to_s + " from " + User.find_by_id(expense.paid_by).name
		end
	end
end

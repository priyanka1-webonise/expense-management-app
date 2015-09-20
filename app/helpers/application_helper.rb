module ApplicationHelper
	def reject_self(members, contributer)
		members.reject{|user| user.id == contributer}
	end
end

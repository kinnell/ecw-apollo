class AssignmentsController < ApplicationController


	private

	def assignment_params
		params.require(:assignment).permit(:project_id, :user_id)
	end



end
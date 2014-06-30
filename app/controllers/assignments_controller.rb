class AssignmentsController < ApplicationController

	def new
		@assignment = Assignment.new
	end


end
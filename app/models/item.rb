class Item < ActiveRecord::Base
	belongs_to :project

	validates :name, presence: true
end
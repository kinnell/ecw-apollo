class Project < ActiveRecord::Base
	belongs_to :product

	has_many :tasks, dependent: :destroy

	has_many :assignments
	has_many :users, :through => :assignments

	accepts_nested_attributes_for :assignments

	validates :name, presence: true
	validates :product_id, presence: true

end

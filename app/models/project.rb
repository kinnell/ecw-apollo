class Project < ActiveRecord::Base
	belongs_to :product

	has_many :tasks, dependent: :destroy
	has_many :items, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_many :assignments, :dependent => :destroy
	has_many :users, :through => :assignments

	accepts_nested_attributes_for :assignments, :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true

	validates :name, presence: true
	validates :product_id, presence: true

	scope :completed, -> { where(:status => "Completed") }
	scope :incomplete, -> { where(:end_date => nil) }

end
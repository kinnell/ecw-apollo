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

	def progress_percent
		tasks.exists? ? (100*(tasks.completed.count.to_f/tasks.count.to_f)).round : 0
	end

	def product_name
	  product.try(:name)
	end

	def product_name=(name)
  		self.product = Product.find_or_create_by_name(name).id if name.present?
	end

	def starred_toggle
		if starred
			'<i class="fa fa-star" style="color: #ffd76e;"></i>'.html_safe
		else
			'<i class="fa fa-star-o" style="color: #999;"></i>'.html_safe
		end
	end



end
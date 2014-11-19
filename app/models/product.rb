class Product < ActiveRecord::Base
	has_many :projects

	validates :name, uniqueness: true

  def deletable?
    projects.empty?
  end

end

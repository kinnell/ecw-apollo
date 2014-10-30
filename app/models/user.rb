class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   validates_format_of :email, :with => /\A[\w+\-.]+@eclinicalworks.com/i, :allow_blank => true, :message=>"needs to be an eClinicalWorks email."

   has_many :assignments, :dependent => :destroy
   has_many :projects, :through => :assignments

   has_many :comments
   has_many :tasks

   has_attached_file :profile_photo, :styles => { :medium => "200x200#", :thumb => "75x75#", :small => "50x50", :tiny => "25x25" }, :default_url => "turtle75.jpg"

end

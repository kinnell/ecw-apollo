class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   validates_format_of :email, :with => /\A[\w+\-.]+@eclinicalworks.com/i, :allow_blank => true, :message=>"needs to be an eClinicalWorks email."

   has_many :assignments, :dependent => :destroy
   has_many :projects, :through => :assignments

   has_many :comments
   has_many :tasks

   has_attached_file :profile_photo, :styles => { :thumb => "100x100#" }


end

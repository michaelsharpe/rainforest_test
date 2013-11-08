class User < ActiveRecord::Base
  has_many :reviews
  has_many :products, :through => :reviews
  
  has_secure_password

  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email, :on =>:create, :message => "Sorry, that email is already in use."
end

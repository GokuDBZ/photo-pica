class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :payment_methods
  # accepts_nested_attributes_for helps parent model to save data of its associated tables or models
  # user has one to many association with payment_methods and by allowing accepts nested attributes we can 
  # make user to dave data for payment methods
  
  accepts_nested_attributes_for :payment_methods
end

class Customer < ActiveRecord::Base
	has_many :orders

	validates_presence_of :name, :phone, :addy1, :city, :state, :zip
	validates :email, confirmation: true
  validates :email_confirmation, presence: true
#  validates :email, uniqueness: true
# use when allowing customers to login and create accounts
end

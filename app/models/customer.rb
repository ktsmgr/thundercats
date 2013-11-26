class Customer < ActiveRecord::Base
	has_one :order
	# Change has_many :orders to has_one :order to limit one order per customer per transaction.
	# But, you have to edit the show.html page

	validates_presence_of :name, :phone, :addy1, :city, :state, :zip
	#validates :email, confirmation: true
  #validates :email_confirmation, presence: true
#  validates :email, uniqueness: true
# use when allowing customers to login and create accounts
end

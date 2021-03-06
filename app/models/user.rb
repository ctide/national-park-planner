class User < ActiveRecord::Base
	has_secure_password

	ROLES = ['admin', 'customer']

	has_and_belongs_to_many :trips

	has_and_belongs_to_many :parks

	belongs_to :survey

	validates :username, :password_digest, :role, :survey, presence: true

	def admin?
		self.role == 'admin'
	end

	def customer?
		self.role == 'customer'
	end
end
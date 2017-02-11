class User < ApplicationRecord
  validates_presence_of :name
  before_save :assign_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :items

  def admin?
	self.role.name == "Admin"
  end

  def customer?
	self.role.name == "Customer"
  end


  def assign_role
    self.role = Role.find_by name: "Customer" if self.role.nil?
  end

end

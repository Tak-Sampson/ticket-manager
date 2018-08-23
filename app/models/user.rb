class User < ActiveRecord::Base
  has_secure_password

  has_many :tickets
  has_many :assigned, class_name: 'Ticket', foreign_key: 'assignee_id'
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 8}

end
class Tag < ActiveRecord::Base
  has_many :ticket_tags
  has_many :tickets, through: :ticket_tags

  default_scope { order(name: :asc) }

  validates :name, presence: true, uniqueness: true
end
class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :assignee, foreign_key: 'assignee_id', class_name: 'User', optional: true

  has_many :ticket_tags
  has_many :tags, through: :ticket_tags
  has_many :comments, dependent: :destroy

  enum status: [:new, :blocked, :in_progress, :fixed], _prefix: true

  validates :name, presence: true
  validates :body, presence: true
  validates :status, presence: true
end
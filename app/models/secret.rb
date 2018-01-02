class Secret < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { in: 2..1000 }
  has_many :likes
end

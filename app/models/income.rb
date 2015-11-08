class Income < ActiveRecord::Base
  belongs_to :account
  belongs_to :category

  validates :name, presence: true
end

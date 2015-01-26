class List < ActiveRecord::Base
  belongs_to :user

  # list must have a title and a description
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  # Validates the uniqueness of a user id so that User can only have one list
  validates_uniqueness_of :user_id, there_can_be_only_one: true
end

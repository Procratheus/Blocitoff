class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  # List must have a title and a description.
  validates :title, presence: true
  validates :description, presence: true
  # Validates the uniqueness of a user id so that User can only have one list with a cystom validation to create our own error message.
  validates :user_id, uniqueness: { value: true , message: "there can be only one! 'The Highlander will now chop your head off.'" }
end

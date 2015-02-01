class Item < ActiveRecord::Base
  belongs_to :list
  has_many :checkeds, dependent: :destroy

  validates :name, presence: true

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end

  def checked_item(item)
    checkeds.where(item_id: item.id).first
  end

  def destroy
    raise "Cannot delete an item unless it has been checked" unless checkeds.count == 1
    super
  end

end


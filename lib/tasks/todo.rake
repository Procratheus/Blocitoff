# Custom rake task to delete items that are older than 7 days
namespace :todo do
  desc "Delete items that are older than 7 days."
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end

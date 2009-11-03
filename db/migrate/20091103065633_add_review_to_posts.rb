class AddReviewToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :review, :string
  end

  def self.down
    remove_column :posts, :review
  end
end

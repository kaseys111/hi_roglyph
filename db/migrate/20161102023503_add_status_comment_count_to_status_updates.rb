class AddStatusCommentCountToStatusUpdates < ActiveRecord::Migration[5.0]
  def change
    add_column :status_updates, :status_comments_count, :integer
  end
end

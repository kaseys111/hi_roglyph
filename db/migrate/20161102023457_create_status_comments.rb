class CreateStatusComments < ActiveRecord::Migration
  def change
    create_table :status_comments do |t|
      t.integer :status_id
      t.string :comment
      t.integer :commenter_id

      t.timestamps

    end
  end
end

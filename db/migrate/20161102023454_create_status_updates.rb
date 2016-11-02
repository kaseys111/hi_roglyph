class CreateStatusUpdates < ActiveRecord::Migration
  def change
    create_table :status_updates do |t|
      t.string :status
      t.integer :poster_id

      t.timestamps

    end
  end
end

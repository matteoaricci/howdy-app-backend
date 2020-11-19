class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.integer :community_id
      t.integer :owner_id
      t.string :topic
      t.timestamps
    end
  end
end

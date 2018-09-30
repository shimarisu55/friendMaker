class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :profile_q_number
      t.string :profile_a
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

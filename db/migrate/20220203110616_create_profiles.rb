class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :address
      t.references :user, foreign_key: true, index: true

      t.timestamps

    end
  end
end

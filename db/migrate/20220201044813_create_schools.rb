class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :location
      t.integer :students
      t.integer :faculty

      t.timestamps
    end
  end
end

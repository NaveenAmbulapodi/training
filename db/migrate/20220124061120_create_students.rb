class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :subject
      t.integer :marks
      t.string :grade

      t.timestamps
    end
  end
end

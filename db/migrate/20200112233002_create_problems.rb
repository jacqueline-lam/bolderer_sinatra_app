class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.date :date
      t.string :color
      t.string :grade
      t.string :image
      t.timestamps null: false
    end
  end
end
class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :color
      t.string :grade
      t.string :image
      t.integer :session_id
      t.timestamps null: false
    end
  end
end
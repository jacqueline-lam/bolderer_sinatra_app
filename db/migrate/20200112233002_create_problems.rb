class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :color
      t.string :grade
      t.string :image
      t.string :session_id
    end
  end
end
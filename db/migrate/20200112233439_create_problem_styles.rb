class CreateProblemStyles < ActiveRecord::Migration
  def change
    create_table :problem_styles do |t|
      t.integer :problem_id
      t.integer :style_id
      t.timestamps null: false
    end
  end
end
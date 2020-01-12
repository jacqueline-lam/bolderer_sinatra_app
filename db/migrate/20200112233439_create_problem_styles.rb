class CreateProblemStyles < ActiveRecord::Migration
  def change
    create_table :problem_styles do |t|
      t.string :problem_id
      t.string :style_id
    end
  end
end
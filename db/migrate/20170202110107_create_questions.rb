class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null:false
      t.string :description, null:false
      t.integer :user_id, null:false
      t.integer :answer_id, null:false
      t.timestamps
    end
  end
end

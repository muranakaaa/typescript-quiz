class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.integer :correct

      t.timestamps
    end
  end
end

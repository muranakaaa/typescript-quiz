class CreateUserAnswerDetails < ActiveRecord::Migration[7.2]
  def change
    create_table :user_answer_details do |t|
      t.references :user_answer, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.integer :user_choice
      t.boolean :is_correct

      t.timestamps
    end
  end
end

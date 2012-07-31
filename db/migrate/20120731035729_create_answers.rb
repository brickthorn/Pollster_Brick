class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :question_id
      t.string :response_id
      t.string :owner_session_id

      t.timestamps
    end
  end
end

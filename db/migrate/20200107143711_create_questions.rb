class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :number
      t.string :qtype
      t.string :optionA
      t.string :optionB
    end
  end
end
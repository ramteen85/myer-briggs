class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      
      t.integer :user_id
      t.string :personality
      t.integer :scoreE
      t.integer :scoreI
      t.integer :scoreS
      t.integer :scoreN
      t.integer :scoreT
      t.integer :scoreF
      t.integer :scoreJ
      t.integer :scoreP
      t.timestamps
      
    end
  end
end

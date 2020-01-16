class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.text :fullname
      t.integer :age
      t.string :gender
      t.string :country
      t.string :state
      t.string :password_digest
      t.string :city
    end
  end
end


# t.integer :scoreE
# t.integer :scoreI
# t.integer :scoreS
# t.integer :scoreN
# t.integer :scoreT
# t.integer :scoreF
# t.integer :scoreJ
# t.integer :scoreP
# t.string :personality

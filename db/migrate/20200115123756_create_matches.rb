class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :personality
      t.string :first_match
      t.string :second_match
      t.string :third_match
      t.string :description
      t.timestamps
    end
  end
end

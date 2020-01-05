class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :ward
      t.string :voter_id
      t.string :phone
      t.string :adhar_number
      t.string :verification_id

      t.timestamps
    end
  end
end

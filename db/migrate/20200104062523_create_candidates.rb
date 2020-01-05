class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.integer :election_id
      t.integer :party_id
      t.integer :user_id

      t.timestamps
    end
  end
end

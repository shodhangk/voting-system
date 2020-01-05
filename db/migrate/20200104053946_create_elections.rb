class CreateElections < ActiveRecord::Migration[6.0]
  def change
    create_table :elections do |t|
      t.string :name
      t.string :additional_instructions
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

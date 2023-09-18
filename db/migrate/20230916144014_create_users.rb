class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role, default: "Guest" # Add default role

      t.timestamps
    end
  end
end

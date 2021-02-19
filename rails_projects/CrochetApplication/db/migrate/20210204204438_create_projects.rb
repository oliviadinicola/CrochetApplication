class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :difficulty
      t.integer :yarn_size
      t.text :instructions
      t.integer :hook_size

      t.timestamps
    end
  end
end

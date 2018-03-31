class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.text :memo
      t.boolean :star
      t.boolean :done

      t.timestamps
    end
  end
end

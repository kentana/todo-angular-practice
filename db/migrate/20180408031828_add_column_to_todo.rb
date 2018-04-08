class AddColumnToTodo < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :due_date, :date
  end
end

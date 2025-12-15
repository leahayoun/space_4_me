class AddDoneToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :done, :boolean, default: false, null: false
  end
end

# null: false est une contrainte, la colonne ne pourra jamais contenir null
# null = aucune valeur, donc chaque tâche doit obligatoirement dire si elle est faite ou non

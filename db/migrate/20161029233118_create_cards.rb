class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end

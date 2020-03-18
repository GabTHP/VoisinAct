class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :number_of_participants
      t.integer :amount_needed

      t.belongs_to :city
      t.belongs_to :a
      t.timestamps
    end
  end
end

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :fan, index: true
      t.belongs_to :favorite_project, index: true

      t.timestamps
    end
  end
end

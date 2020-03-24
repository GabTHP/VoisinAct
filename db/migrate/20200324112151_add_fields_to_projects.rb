class AddFieldsToProjects < ActiveRecord::Migration[5.2]
  def self.up
    add_column :projects, :amount_state, :decimal
    add_column :projects, :deadline, :date
    add_column :projects, :is_over, :boolean
  end

  def self.down
    remove_column :projects, :amount_state, :decimal
    remove_column :projects, :deadline, :date
    remove_column :projects, :is_over, :boolean
  end



end

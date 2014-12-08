class AddNeedHelpWithToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :need_help_with, :string
  end
end

class AddNeedHelpWithToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :need_help_with, :string
    rename_column :projects, :primary_language, :language
  end
end

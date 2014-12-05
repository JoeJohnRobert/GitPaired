class ChangeCollaboratorWantedInProjects < ActiveRecord::Migration
  def change
    change_column :projects, :collaborator_wanted, :boolean, :default => false
  end
end

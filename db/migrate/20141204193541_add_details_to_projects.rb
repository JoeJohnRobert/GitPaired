class AddDetailsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :archive_url, :string
    add_column :projects, :pushed_at, :datetime
    add_column :projects, :language, :string
    add_column :projects, :watchers_count, :integer
    add_column :projects, :tags_url, :string
    add_column :projects, :contributors_url, :string
    add_column :projects, :collaborators_url, :string
  end
end

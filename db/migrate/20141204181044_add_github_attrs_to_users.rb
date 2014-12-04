class AddGithubAttrsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gh_url, :string
    add_column :users, :gh_username, :string
    add_column :users, :repos_url, :string
    add_column :users, :public_repos, :integer
    add_column :users, :following, :integer
    add_column :users, :followers, :integer
    add_column :users, :gh_created_at, :datetime
    add_column :users, :blog_url, :datetime
  end
  
end



class AddApprovalToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :approval, :boolean
  end
end

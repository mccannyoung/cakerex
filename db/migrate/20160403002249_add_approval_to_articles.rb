class AddApprovalToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :approval, :boolean
  end
end

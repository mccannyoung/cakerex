class AddSourceurlToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :url, :string
  end
end

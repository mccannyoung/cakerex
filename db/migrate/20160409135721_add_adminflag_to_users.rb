class AddAdminflagToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :adminflag, :integer
  end
end

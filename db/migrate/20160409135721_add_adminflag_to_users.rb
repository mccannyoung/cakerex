class AddAdminflagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :adminflag, :integer
  end
end

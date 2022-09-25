class RemoveUserIdFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :user_id, :integer
  end
end

class AddRememberDigestToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :remember_digest, :string
  end
end

class AddRememberDigestToSchoolUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :school_users, :remember_digest, :string
  end
end

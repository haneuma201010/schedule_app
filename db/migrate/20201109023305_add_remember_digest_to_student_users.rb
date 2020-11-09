class AddRememberDigestToStudentUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :student_users, :remember_digest, :string
  end
end

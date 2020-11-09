class CreateSchoolStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :school_students do |t|
      
      t.references :school_user, index: true, foreign_key: true
      t.references :student_user, index: true, foreign_key: true

      t.timestamps
    end
  end
end

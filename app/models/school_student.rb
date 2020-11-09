class SchoolStudent < ApplicationRecord
  belongs_to :school_user
  belongs_to :student_user
end

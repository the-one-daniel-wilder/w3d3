class Enrollment < ActiveRecord::Base
  validates :course_id, :student_id, null: false

  belongs_to :user,
    primary_key: :id,
    class_name: :User,
    foreign_key: :student_id

  belongs_to :course,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course

end

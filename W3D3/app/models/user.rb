class User < ActiveRecord::Base
  validates :name, null: false

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course

end


# has_many
# SELECT "users".* FROM "users"
# WHERE "users"."instructor_id" = ? ORDER BY "users"."id" ASC LIMIT 1  ==> [[nil, 1]]

# belongs_to
# SELECT "users".* FROM "users"
# WHERE "users"."id" = ? ORDER BY "users"."id" ASC LIMIT 1  ==> [["id", 5]]

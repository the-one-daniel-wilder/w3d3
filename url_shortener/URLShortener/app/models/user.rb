class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true


  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

end




# validate :real_email
#
# def real_email
#   self.email.is_a?(Email)
# end

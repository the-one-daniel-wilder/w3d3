class Visit < ActiveRecord::Base
  validates :user_id, :short_url_id, presence: true

  def self.record_visit!(user, shortened_url)
    v = Visit.new(user_id: user.id, short_url_id: shortened_url.id)
    v.save
  end


  #count submitted_urls

  has_many :visitors,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl

end

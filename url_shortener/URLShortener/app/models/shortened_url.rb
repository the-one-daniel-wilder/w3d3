require 'byebug'

class ShortenedUrl < ActiveRecord::Base
  validates :user_id, :long_url, :short_url, presence: true
  validates :short_url, uniqueness: true


  def self.create!(user, long_url)
    s = ShortenedUrl.new(user_id: user.id, long_url: long_url)
    s.random
    s.save
  end

  def random_code
    random_16_string = nil
    loop do
      random_16_string = SecureRandom::urlsafe_base64(12)
      break if !ShortenedUrl.exists?(:short_url => random_16_string)
    end
    self.short_url = random_16_string
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


end

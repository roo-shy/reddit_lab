class Post < ActiveRecord::Base
  validates :title, :link, :photo_url, presence: true

  has_many :comments
  belongs_to :user

end

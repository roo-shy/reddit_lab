class Post < ActiveRecord::Base
  validates :title, :link, :submitted_by, :photo_url, presence: true
end

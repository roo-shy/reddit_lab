class Post < ActiveRecord::Base
  validates :title, :link, presence: true

  has_many :comments
  belongs_to :user

end

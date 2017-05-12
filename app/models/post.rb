class Post < ApplicationRecord
	
  validates :title, presence: true, length: { minimum: 1 }
  validates :body, presence: true
  validates :country_id, presence: false
  validates :photo, presence: false

  mount_uploader :photo, PostsUploader

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :writer
  belongs_to :country
  
end

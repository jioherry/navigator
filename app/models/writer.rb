class Writer < ApplicationRecord

	validates :name, presence: true, length: { minimum: 1 }
  validates :Introduction, presence: false
  validates :experience, presence: false
  validates :photo, presence: false

	mount_uploader :photo, PostsUploader

	has_many :articles
	has_many :posts

end

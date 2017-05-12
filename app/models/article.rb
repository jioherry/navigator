class Article < ApplicationRecord

	validates :title, presence: true, length: { minimum: 1 }
  validates :content, presence: true
  validates :photo, presence: false

  mount_uploader :photo, PostsUploader

	belongs_to :writer

	has_many :responses

end

class Response < ApplicationRecord

	validates :body, presence: false
	validates :user_id, presence: false
	validates :article_id, presence: false

	belongs_to :article
	belongs_to :user

end

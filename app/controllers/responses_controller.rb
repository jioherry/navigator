class ResponsesController < ApplicationController

	def new
		@response = Response.new
	end

	def create
		@response = current_user.responses.new(response_params)
		@response.article_id = params[:article_id]
		@response.save

		redirect_to article_path(params[:article_id])
	end

	def update
		@response = current_user.responses.find(params[:id])
		@response.update(response_params)
		article = Article.find(params[:article_id])

		redirect_to article_url(article)
	end

	private

		def response_params
			params.require(:response).permit(:body, :article_id, :user_id)
		end

end

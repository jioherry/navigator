class PostsController < ApplicationController

  def index
  end



  def show
  end





  def work_case
    if params[:countries].present? # params[:categories] != '' present == not_blank
      @country = Country.find(params[:countries])
      @posts = @country.posts.order('created_at DESC').page.per(10)
    else
      @posts = Post.all.order('created_at DESC').page.per(10)
    end
  end

  def adoutus
    issue = Issue.new(issue_params)
    if issue.save
      UserMailer.notify_issue(current_user, issue).deliver_later!
      redirect_to aboutus_posts_path
    else
      render :action => :aboutus
    end
  end

  def signup
    render layout: false
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :photo, :country_id)
  end


end

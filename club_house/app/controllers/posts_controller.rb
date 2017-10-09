class PostsController < ApplicationController

  before_action :require_signin, only: [:new, :create]


  def index
    @posts= Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create

    @post = current_user.posts.create(posts_params)
    if @post.save
      redirect_to posts_path
      flash[:success]="your post has been saved"
    else
      errors_template(@post)
      render :new
    end
  end

  def require_signin
    unless signed_in?
      flash[:danger] = "You must sign in to acquire an access"
      redirect_to signin_path # halts request cycle
    end
  end




  private
  def posts_params
    params.require(:post).permit(:post_title, :post_content)
  end
end

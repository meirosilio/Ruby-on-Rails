class PostsController < ApplicationController


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





  private
  def posts_params
    params.require(:post).permit(:post_title, :post_content)
  end
end

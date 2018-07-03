class PostsController < ApplicationController
before_action :authenticate_admin!, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
  end

  

  def new
  	@post = Post.new
    @types = ["HTML/CSS", "Javascript/Jquery", "Ruby", "Rails", "Coding challenges", "Random"]
  end

  def create
  	post = Post.new(post_params)
  	if post.save
  		redirect_to "/posts"
  	else
  		render "/posts/new"
  	end
  end

  def show
    post_find
    @comment = Comment.new
  end

  def edit
    post_find
    @types = ["HTML/CSS", "Javascript/Jquery", "Ruby", "Rails", "Coding challenges", "Random"]
  end

  def update
    p = post_find
    if p.update(post_params)
      redirect_to '/posts'
    else
      render "/posts/#{p.id}/edit"
    end
  end

  def destroy
    p = post_find
    p.destroy
    redirect_to "/posts"
  end


  private

  def post_params
  	params.require(:post).permit(:title, :content, :category)
  end

  def post_find
    @post = Post.find(params[:id])
  end

end

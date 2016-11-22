class HomeController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
   # @user=User.new
    @post=Post.new
    @posts=Post.all
    #@posts = Project.search(params[:search])
  end
 # def search
  #      @posts = Post.all
   #     if params[:search]
    #        @posts=Post.search(params[:search]).order("created_at DESC")
     #   end
#  end
    
  def create
    @post = Post.new(post_params)
    @post.save
   
    redirect_to :back
  end
  
  def edit
    @post = Post.find(params[:id])
    authorize @post, :update?
  end
  
  def update
     @post = Post.find(params[:id])
    authorize @post, :update?
    @post.update(update_params)
    
    redirect_to "/home/index"
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post, :update?
    @post.destroy
    redirect_to :back
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :scope)
  end
  
  def update_params
    params.require(:post).permit(:title, :content, :scope)
  end
end

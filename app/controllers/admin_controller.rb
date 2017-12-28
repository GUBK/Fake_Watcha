class AdminController < ApplicationController
  def index
    @users = User.all
  end

  def posts
    @posts = Post.all
  end

  def posts_destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back, notice: "#{params[:id]}번 게시글 삭제됨"
  end

  def reviews
    @reviews = Review.all
  end

  def reviews_destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back, notice: "#{params[:id]}번 게시글 삭제됨"
  end

  def change_to_manager
    user = User.find(params[:id])
    user.update(
      role: "manager",
      nickname: "매니저"
    )
    flash[:notice] = "매니저가 되었습니다."
    redirect_to :back

  end

  def change_to_user
    user = User.find(params[:id])
    user.update(
      role: "user",
      nickname: "양민"
    )

    redirect_to :back, notice: "양민이 되었습니다."
  end
end

class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  # def index
  #   @posts = Post.all.order(created_at: :desc)
  # + @post_favorites_count = favorites.group(:post_id).count
  # end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  
  def destory
    favorite.destroy
    redirect_to topics_path(params[:topic_id])
  end
  end
end

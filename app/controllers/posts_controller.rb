class PostsController < ApplicationController
    before_action :authenticate_user!
    def index
        @tags = Tag.all
        if params[:search] == nil
            # @posts= Post.all
            @posts = params[:name].present? ? Tag.find(params[:name]).posts : Post.all
        elsif params[:search] == ''
            # @posts= Post.all
            @posts = params[:name].present? ? Tag.find(params[:name]).posts : Post.all
        else
        #部分検索
            @posts = Post.where("contents LIKE ? ",'%' + params[:search] + '%')
        end
    end
    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
    end
    def new
        @post = Post.new
    end
    def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end
    def edit
        @post = Post.find(params[:id])
    end
    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            redirect_to :action => "show", :id => post.id
        else
            redirect_to :action => "index"
        end
    end
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
    end
    def done
    #     @user = User.find(params[:id])
    #     @currentUserEntry=Entry.where(user_id: current_user.id)
    #     @userEntry=Entry.where(user_id: @user.id)
    #     if @user.id == current_user.id
    #     else
    #         @currentUserEntry.each do |cu|
    #             @userEntry.each do |u|
    #                 if cu.room_id == u.room_id then
    #                     @isRoom = true
    #                     @roomId = cu.room_id
    #                 end
    #             end
    #         end
    #         if @isRoom
    #         else
    #             @room = Room.new
    #             @entry = Entry.new
    #         end
    #     end
    # end
        # def buy
    #     # 買う
    #     deposit = current_user.deposit
    #     photo = Post.find(params[:id])
    #     price = photo.price
    #     current_user.update(deposit: deposit - price)
    #     # 売る
    #     seller = User.find_by(id: photo.user_id)
    #     deposits = seller.deposit
    #     seller.update(deposit: deposits + price)
    #     redirect_back(fallback_location: root_path)
    end
    private
    def post_params
        params.require(:post).permit(:title, :contents, :image, :price, :user_id, tag_ids: [])
    end
end

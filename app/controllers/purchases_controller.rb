class PurchasesController < ApplicationController
    def create
        purchase = current_user.purchases.create(post_id: params[:post_id]) #user_idとtweet_idの二つを代入
        # 買う
        deposit = current_user.deposit
        photo = Post.find(params[:post_id])
        price = photo.price
        current_user.update(deposit: deposit - price)
        # 売る
        seller = User.find_by(id: photo.user_id)
        deposits = seller.deposit
        seller.update(deposit: deposits + price)
        if purchase.save
            redirect_to :controller => "posts", :action => "done"
        else
            redirect_to :controller => "posts", :action => "index"
        end
        # redirect_back(fallback_location: root_path)
    end
    # def destroy
    #     purchase = purchase.find_by(post_id: params[:post_id], user_id: current_user.id)
    #     purchase.destroy
    #     redirect_back(fallback_location: root_path)
    # end
end


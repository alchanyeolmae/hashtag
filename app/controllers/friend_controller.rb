class FriendController < ApplicationController
    def myfriend
        @friend = User.find_by_nickname(params[:friend])
        @friends = current_user.friends
        @users = User.all
        @requested = current_user.requested_friends
    end
    
    def search
        @users = User.all
        if params[:search]
            @users=User.search(params[:search]).order("created_at DESC")
        end
    end
    
    def result
    end

    def f_request
        @current_user=current_user
        @friend = User.find_by_nickname(params[:friend])
        current_user.friend_request(@friend)
        redirect_to '/friend/myfriend'
    end

    def f_accept
        @current_user=current_user
        @friend = User.find_by_nickname(params[:friend])
        current_user.accept_request(@friend)
        redirect_to '/friend/myfriend'
    end

    def f_decline
       
        @friend = User.find_by_nickname(params[:friend])
        current_user.decline_request(@friend)
        redirect_to '/friend/myfriend'
    end
end

class Api::FriendsController < ApplicationController
    before_action :authenticate_user!
    def index

        begin
            @friends = Friend.where(ask: current_user).or(Friend.where(receive: current_user))
            @json = @friends.map { |friend| 

            if friend.ask == current_user
                @friend1 = friend.receive
            else
                @friend1 = friend.ask
            end
            
            @friend1.to_c_json
            
        }
        rescue Exception => test
            @json = test
        ensure
            render json: @json
        end

    end

    def show
    end

    def create
    end

    def update
    end

    def delete
    end

    def destroy
    end

end
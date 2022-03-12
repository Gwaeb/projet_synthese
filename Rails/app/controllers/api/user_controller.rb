class Api::UserController < ApplicationController

    def show
        render json: current_user
    end

    def desc
        begin
            @user = User.find_by(id: params[:id])
            if @user.picture.attached? 
                @json = @user.to_c_json
            end
        rescue Exception => test
            @json = {}
        ensure
            render json: @json
        end
    end


end
class Api::SkinsController < ApplicationController

    def index
        unless params[:champion_id]
            @skin = Skin.all.joins(:picture_attachment)
        else
            begin
                @skin = Champion.find_by(id: params[:champion_id]).skins
            rescue Exception => test
                @skin = []
            end
        end
        render json: @skin.map { |skin| skin.to_json }
    end 

    def show

        begin
            @skin = Skin.find_by(id: params[:id])
            if @skin.picture.attached? 
                @json = @skin.to_json
            end
        rescue Exception => test
            @json = {}
        ensure
            render json: @json
        end
    end 

end



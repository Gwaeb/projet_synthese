class Api::ChampionsController < ApplicationController

    def index
        @champion = Champion.all.joins(:picture_attachment)
        render json: @champion.map { |champion| champion.to_json }
    end 

    def show
        begin
            @champion = Champion.find_by(id: params[:id])
            if @champion.picture.attached? 
                @json = @champion.to_json
            end
        rescue Exception => test
            @json = {}
        ensure
            render json: @json
        end
    end
end
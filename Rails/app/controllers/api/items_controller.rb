class Api::ItemsController < ApplicationController

    def index
        @item = Item.all.joins(:picture_attachment)
        render json: @item.map { |item| item.to_json }
    end 

    def show
        begin
            @item = Item.find_by(id: params[:id])
            if @item.picture.attached? 
                @json = @item.to_json
            end
        rescue Exception => test
            @json = {}
        ensure
            render json: @json
        end
    end 

end


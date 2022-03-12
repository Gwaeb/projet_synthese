class Api::RunesController < ApplicationController

    def index
        unless params[:category_id]
            @rune = Rune.all.joins(:picture_attachment)
        else
            begin
                @rune = Category.find_by(id: params[:category_id]).runes
            rescue Exception => test
                @rune = []
            end
        end
        render json: @rune.map { |rune| rune.to_json}
    end 

    def show

        begin
            @rune = Rune.find_by(id: params[:id])
            if @rune.picture.attached? 
                @json = @rune.to_json
            end
        rescue Exception => test
            @json = {}
        ensure
            render json: @json
        end

    end 

end


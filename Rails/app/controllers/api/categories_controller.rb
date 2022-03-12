class Api::CategoriesController < ApplicationController
    
    def index
        @category = Category.all.joins(:picture_attachment)
        render json: @category.map { |category| category.to_json }
    end 

    def show

        begin
            @category = Category.find_by(id: params[:id])
            if @category.picture.attached? 
               @json = @category.to_json
            end
        rescue Exception => test
            @json = {}
        ensure
            render json: @json
        end
    end 

end


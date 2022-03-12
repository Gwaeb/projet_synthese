class Api::BuildsController < ApplicationController
    before_action :authenticate_user!
    def index

        begin
            @builds = Build.where(user: current_user)
            @json = @builds.map { |build| build.to_json }
        rescue Exception => test
            @json = []
        ensure
            render json: @json
        end

    end

    def show

        begin
            @build = Build.where(id: params[:id], user: current_user).first
            if @build
                @json = @build.to_json
            else
                @json = {}
            end
        rescue Exception => test
            @json = {}
        ensure
            render json: @json
        end

    end

    def create

        begin
            @items = params[:items]
            @build = Build.new(user: current_user, name: params[:name], category: params[:category])
            
            if @build.valid?

                @items = @items.map.with_index  { |item, index| BuildsHasItem.create(build: @build, item:  Item.find_by(id: item[:id]), order: index) }
                
                if @build.save
                    @json = {data: @build.to_json, success: true}
                else
                    @json = {success: false, errors: @build.errors}
                end
            else
                @json = {success: false, errors: @build.errors.as_json}
            end
        rescue Exception => test
            @json = {errors: [test], success: false}
        ensure
            render json: @json
        end
    end

    def update

        begin
            @build = Build.find_by(id: params[:id]);
            if @build
                @permet = params.permit(:name, :category)
                @build.assign_attributes(@permet)
                @build.items.destroy_all
                @items = params[:items]
                @items = @items.map.with_index  { |item, index| BuildsHasItem.create(build: @build, item:  Item.find_by(id: item[:id]), order: index) }
                if @build.save
                    @json = {data: @build.to_json, success: true}
                else
                    @json = {errors: @build.errors.as_json, success: false}
                end
            else
                @json = {success: false,errors: "No Build Found"}
            end
        rescue Exception => test
            @json = {errors: [test], success: false}
        ensure
            render json: @json
        end


    end

    def destroy
        
        begin
            @build = Build.where(user: current_user, id: params[:id]).first
            if @build
                if @build.destroy
                    @json = {data: @build.as_json, success: true}
                else
                    @json = {errors: @build.errors, success: false}
                end
            else
                @json = {success: false,errors: "No Build Found"}
            end
        rescue Exception, ActiveRecord::InvalidForeignKey => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end
        

    end

end
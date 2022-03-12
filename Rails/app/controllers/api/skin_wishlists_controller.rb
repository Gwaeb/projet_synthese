class Api::SkinWishlistsController < ApplicationController
    before_action :authenticate_user!
    def index

        begin
            @skinList = SkinWishlist.where(user: current_user)
            @json = @skinList.map { |skin| skin.to_json }
        rescue Exception => test
            @json = []
        ensure
            render json: @json
        end

    end

    def show

        begin
            @skinList = SkinWishlist.where(id: params[:id], user: current_user).first
            if @skinList
                @json = @skinList.to_json
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
            @skin = Skin.find_by(id: params[:id]);
            @wishlist = SkinWishlist.new(user: current_user, skin: @skin)
            if @wishlist.save
                @json = {data: @wishlist.to_json, success: true}
            else
                @json = { errors: @wishlist.errors.as_json, success: false}
            end
        rescue Exception => test
            @json = { errors: [test, success: false]}
        ensure
            render json: @json
        end


    end

    def update
        begin
            @old = SkinWishlist.where(user: current_user, skin_id: params[:oldID]).first
            @newSkin = Skin.find_by(id: params[:id]);
            if @old && @newSkin
                @old.update(skin: @newSkin);
                @json = {data: @old.to_json, success: true}
            else
                @json = {success: false,errors: "No Skins Found"}
            end
            
        rescue Exception => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end
    end


    def destroy
        begin
            @wishlist = SkinWishlist.where(user: current_user, skin_id: params[:id]).first
            if @wishlist
                if @wishlist.destroy
                    @json = {data: @wishlist.to_json, success: true}
                else
                    @json = {errors: @wishlist.errors, success: false}
                end
            else
                @json = {success: false,errors: "No Skins Found"}
            end
        rescue Exception => test
            @json = { errors: [test], success: false}
        ensure
            render json: @json
        end
    end

end
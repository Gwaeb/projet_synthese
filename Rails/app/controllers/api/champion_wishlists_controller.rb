class Api::ChampionWishlistsController < ApplicationController
    before_action :authenticate_user!
    def index
        begin
            @championList = ChampionWishlist.where(user: current_user)
            @json = @championList.map { |champion| champion.to_json }
        rescue Exception => test
            @json = []
        ensure
            render json: @json
        end
    end

    def show
        begin
            @championList = ChampionWishlist.where(id: params[:id], user: current_user).first
            if @championList
                @json = @championList.to_json
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
            @champion = Champion.find_by(id: params[:id]);
            @wishlist = ChampionWishlist.new(user: current_user, champion: @champion)
            if @wishlist.save
                @json = {data: @wishlist.to_json, success: true}
            else
                @json = { errors: @wishlist.errors.as_json, success: false}
            end
        rescue Exception => test
            @json = {errors: [test], success: false}
        ensure
            render json: @json
        end
    end

    def update
        begin
            @old = ChampionWishlist.where(user: current_user, champion_id: params[:oldID]).first
            @newChamp = Champion.find_by(id: params[:id]);
            if @old && @newChamp
                @old.update(champion: @newChamp);
                @json = {data: @old.to_json, success: true}
            else
               @json = {success: false, errors: "No Champions Found"}
            end
        rescue Exception => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end
    end

    def destroy
        begin
            @wishlist = ChampionWishlist.where(user: current_user, champion_id: params[:id]).first
            if @wishlist

                if @wishlist.destroy
                    @json = {data: @wishlist.to_json, success: true}
                else
                    @json = {errors: @wishlist.errors, success: false}
                end
            else
                @json = {success: false,errors: "No Champions Found"}
            end
        rescue Exception => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end 
    end
end
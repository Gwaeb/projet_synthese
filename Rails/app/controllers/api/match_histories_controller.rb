class Api::MatchHistoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        begin
            @matchs = MatchHistory.where(user: current_user)
            @json = @matchs.map { |match| match.to_json }
        rescue Exception => test
            @json = test
        ensure
            render json: @json
        end
    end

    def show
        begin
            @match = MatchHistory.where(id: params[:id], user: current_user).first
            if @match
                @json = @match.to_json
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
            if params[:champion]
                @champion = Champion.find_by(id: params[:champion][:id])
                if params[:build]
                    @build = Build.where(id: params[:build][:id],user: current_user).first
                    if params[:rune_page]
                        @runePage = RunePage.where(id: params[:rune_page][:id],user: current_user).first

                        @match = MatchHistory.new(champion: @champion, build: @build, rune_page: @runePage, position: params[:position], victory: params[:victory], last_item: params[:last_item],user: current_user)
                
                        if @match.save
                            @json = {data: @match.to_json, success: true}
                        else
                            @json = {errors: @match.errors.as_json, success: false}
                        end

                    else
                        @json = {errors:["No Rune Page Found"], success: false}
                    end
                else
                    @json = {errors:["No Build Found"], success: false}
                end
            else
                @json = {errors:["No Champion Found"], success: false}
            end
        rescue Exception => test
            @json = {errors: [test], success: false}
        ensure
            render json: @json
        end

    end

    def update
        begin
            @match = MatchHistory.where(id: params[:id],user:current_user).first
            if @match
                if params[:champion]
                    @champion = Champion.find_by(id: params[:champion][:id])
                
                    if params[:build]
                        @build = Build.where(id: params[:build][:id], user: current_user).first
                        if params[:rune_page]
                            @runePage = RunePage.where(id: params[:rune_page][:id], user: current_user).first

                            @match.assign_attributes(champion: @champion, build: @build, rune_page: @runePage, position: params[:position], victory: params[:victory], last_item: params[:last_item])
                            if @match.save
                                @json = {data: @match.to_json, success: true}
                            else
                                @json = {errors: @match.errors.as_json, success: false}
                            end
                        else
                            @json = {errors:["No Rune Page Found"], success: false}
                        end
                    else
                        @json = {errors:["No Build Found"], success: false}
                    end
                else
                    @json = {errors:["No Champion Found"], success: false}
                end
            else
                @json = {success: false,errors: ["No Match Found"]}
            end
        rescue Exception => test
            @json = {errors: [test], success: false}
        ensure
            render json: @json
        end

    end

    def destroy
        begin
            @match = MatchHistory.where(user: current_user, id: params[:id]).first
            if @match
                if @match.destroy
                    @json = {data: @match.to_json, success: true}
                else
                    @json = {errors: @match.errors, success: false}
                end
            else
                @json = {success: false,errors: ["No Match Found"]}
            end
        rescue Exception, ActiveRecord::InvalidForeignKey => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end
        
    end

end
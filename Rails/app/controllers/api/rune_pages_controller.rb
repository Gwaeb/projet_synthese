class Api::RunePagesController < ApplicationController
    before_action :authenticate_user!
    def index

        begin
            @runepages = RunePage.where(user: current_user)
            @json = @runepages.map { |runepage| runepage.to_json}
        rescue Exception => test
            @json = []
        ensure
            render json: @json
        end

    end

    def show

        begin
            @runepage = RunePage.where(id: params[:id], user: current_user).first
            if @runepage
                @json = @runepage.to_json
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
            @runes = params[:runes]
            @page = RunePage.new(user: current_user, name: params[:name])

            if @page.valid?
                
                if @runes && @runes.length == 9
                    @runes = @runes.map.with_index  { |rune| RunesHasRunesPage.create(rune_page: @page, rune:  Rune.find_by(id: rune)) }
                    
                    if @page.save
                        @json = {data: @page.to_json, success: true}
                       
                    else
                        @json = {success: false, errors: @page.errors}
                    end
                else
                    @json = {success: false, errors: ["Not Enought Runes"]}
                end

            else
                @json = {success: false, errors: @page.errors.as_json}
            end
        rescue Exception => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end



    end

    def update

        begin
            @page = RunePage.where(id: params[:id],user: current_user).first;
            if @page
                @permet = params.permit(:name)
                @page.assign_attributes(@permet)
                @page.runes.destroy_all
                @runes = params[:runes]
                
                if @runes && @runes.length == 9
                   
                    @runes = @runes.map.with_index  { |rune| @page.runes << Rune.find_by(id: rune) }
                

                    if @page.save 
                        @json = {data: @page.to_json, success: true}
                    else
                        @json = {errors: @page.errors, success: false}
                    end

                else
                    @json = {errors: ["Not Enought Rune"], success: false}
                end
               
            else
                @json = {errors: ["No Page Found"], success: false}
            end
        rescue Exception => test
            @json = {errors: [test], success: false}
        ensure
            render json: @json
        end

    end

    def destroy

        begin
            @page = RunePage.where(user: current_user, id: params[:id]).first
            if @page
                if @page.destroy
                    @json = {data: @page.as_json, success: true}
                else
                    @json = {errors: @page.errors, success: false}
                end
            else
                @json = {success: false,errors: ["No Page Found"]}
            end
        rescue Exception, ActiveRecord::InvalidForeignKey => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end
        


    end

end
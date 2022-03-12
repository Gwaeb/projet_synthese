class Api::PlanningsController < ApplicationController
    before_action :authenticate_user!
    def index

        begin
            @plannings = Planning.where(creator: current_user).or(Planning.where(id: FriendsHasPlanning.where(friend: current_user).map(&:planning_id)))
            @json = @plannings.map{ |planning| planning.to_json}
        rescue Exception => test
            @json = []
        ensure
            render json: @json
        end

    end

    def show
        begin
            @planning = Planning.where(id: params[:id], creator: current_user).first
            unless @planning
                @json = {}
            else
                @json = @planning.to_json
            end
        rescue Exception => test
            @json = {}
        ensure
            render json: @json
        end
    end

    def pending

        begin
            @plannings = Planning.where(id: FriendsHasPlanning.where(friend: current_user, accepted_at: nil).map(&:planning_id))
            @json = @plannings.map{ |planning| planning.to_json}
        rescue Exception => test
            @json = []
        ensure
            render json: @json
        end

    end

    def create
       
        begin
            @planning = Planning.new(creator:current_user,title: params[:title],date: params[:date])
            if @planning.valid?
                if params[:friends]
                    @friends = params[:friends]
                    @friends = @friends.map { |friend| FriendsHasPlanning.create(friend: User.find_by(id: friend[:id]), planning: @planning)}
                end
                if @planning.save
                    @json = {data: @planning.to_json, success: true}
                else
                    @json = {errors: @planning.errors.as_json, success: false}
                end
            else 
                @json = {errors: @planning.errors.as_json, success: false}
            end
        rescue Exception => test
            @json = {errors: [test], success: false}
        ensure
            render json: @json
        end

    end

    def accept

        begin
            @planning = Planning.where(id: FriendsHasPlanning.where(friend: current_user, accepted_at: nil).map(&:planning_id)).find_by(id: params[:id])
            if @planning
                @friendPlanning = FriendsHasPlanning.where(planning: @planning, friend: current_user).first
                @friendPlanning.assign_attributes({accepted_at: DateTime.now()})
                if @friendPlanning.save
                    @json = {success: true, data: @planning.to_json}
                else
                    @json = {success: false, errors: @friendPlanning.errors}
                end
            else
                @json = {success: false, errors: ["No planning found"]}
            end

        rescue Exception => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end

    end

    def deny

        begin
            @planning = Planning.where(id: FriendsHasPlanning.where(friend: current_user, accepted_at: nil).map(&:planning_id)).find_by(id: params[:id])
            if @planning
                @friendPlanning = FriendsHasPlanning.where(planning: @planning, friend: current_user).first
                if @friendPlanning.destroy
                    @json = {success: true, data: @planning.to_json}
                else
                    @json = {success: false, errors: @friendPlanning.errors}
                end
            else
                @json = {success: false, errors: ["No planning found"]}
            end

        rescue Exception => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end
    end

    def update

        begin
            @planning = Planning.where(creator: current_user,id: params[:id]).first;
            if @planning
                @permet = params.permit(:title, :date)
                @planning.assign_attributes(@permet)
                @planning.friends.destroy_all
                if params[:friends]
                    @friends = params[:friends]
                    @friends = @friends.map { |friend| @planning.friends << User.find_by(id: friend[:id])}
                end

                if @planning.save
                    @json = {data: @planning.to_json, success: true}
                else
                    @json = {errors: @planning.errors.as_json, success: false}
                end
            else
                @json = {success: false,errors: ["No Planning Found"]}
            end
        rescue Exception => test
            @json = {errors: [test], success: false}
        ensure
            render json: @json
        end

    end

    def destroy
        begin
            @planning = Planning.find_by(id: params[:id])
            if @planning
                if @planning.creator == current_user
                    if @planning.destroy
                        @json = {data: @planning.as_json, success: true}
                    else
                        @json = {errors: @planning.errors, success: false}
                    end
                else
                    if @planning.friends.find_by(id:current_user)
                        if @planning.friends.delete(current_user)
                            @json = {data: @planning.as_json, success: true}
                        else
                            @json = {errors: @planning.errors, success: false}
                        end
                    else
                        @json = {success: false, errors: ["No Planning Found"]}
                    end
                end
            else
                @json = {success: false, errors: ["No Planning Found"]}
            end

        rescue Exception => test
            @json = {success: false, errors: [test]}
        ensure
            render json: @json
        end
    end


end
require "test_helper"

class PlanningsControllerTest < ActionDispatch::IntegrationTest

    include Devise::Test::IntegrationHelpers
    
    #rails test test/controllers/api/plannings_controller.rb

    test "indexValid" do
        sign_in users(:one)
        get "/api/plannings/"
        json = JSON.parse(@response.body)
        assert_equal("planning1",json[0]["title"])
        assert_equal("planning2",json[1]["title"])
    end

    test "indexInvalidUser" do
        get "/api/plannings/"
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "showValid" do 
        sign_in users(:one)
        get "/api/plannings/1"
        json = JSON.parse(@response.body)
        assert_equal("planning1",json["title"])
    end

    test "showInvalidUser" do 
        get "/api/plannings/1"
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "showInvalidUserId" do 
        sign_in users(:two)
        get "/api/plannings/1"
        assert_equal("{}",@response.body)
    end

    test "showInvalidPlanningId" do 
        sign_in users(:one)
        assert_nil(Planning.find_by(id: 100))
        get "/api/plannings/100"
        assert_equal("{}",@response.body)
    end

    test "createValid" do
        sign_in users(:one)
        assert_not_equal("planning test",Planning.last.title)
        post "/api/plannings/", params: {title: "planning test", date:DateTime.now(),friends: [User.last.to_c_json]} 
        assert_equal(JSON.parse(@response.body)["data"]["friends"][0]["id"],User.last.id)
        assert_equal("planning test",Planning.last.title)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "createInvalidUser" do
        assert_not_equal("planning test",Planning.last.title)
        post "/api/plannings/", params: {title: "planning test", date: DateTime.now(), friends: [User.last.to_c_json]} 
        assert_not_equal("planning test",Planning.last.title)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidNoDate" do
        sign_in users(:one)
        assert_not_equal("planning test",Planning.last.title)
        post "/api/plannings/", params: {title: "planning test", friends: [User.last.to_c_json]} 
        assert_not_equal("planning test",Planning.last.title)
        assert_equal(["can't be in the past"],JSON.parse(@response.body)["errors"]["date"])
        assert_equal(false,JSON.parse(@response.body)["success"])
    end

    test "createInvalidDate" do 
        sign_in users(:one)
        assert_not_equal("planning test",Planning.last.title)
        post "/api/plannings/", params: {title: "planning test", date: "2020-01-02 12:23:32", friends: [User.last.to_c_json]} 
        assert_not_equal("planning test",Planning.last.title)
        assert_equal(["can't be in the past"],JSON.parse(@response.body)["errors"]["date"])
        assert_equal(false,JSON.parse(@response.body)["success"])
    end

    test "createInvalidNoTitle" do 
        sign_in users(:one)
        assert_equal("planning3",Planning.last.title)
        post "/api/plannings/", params: {date: DateTime.now(), friends: [User.last.to_c_json]} 
        assert_equal("planning3",Planning.last.title)
        assert_equal(["can't be blank","is too short (minimum is 1 character)","is too long (maximum is 255 characters)"],JSON.parse(@response.body)["errors"]["title"])
        assert_equal(false,JSON.parse(@response.body)["success"])
    end

    test "createInvalidWrongTitle" do 
        sign_in users(:one)
        assert_equal("planning3",Planning.last.title)
        post "/api/plannings/", params: {title: " ",date: DateTime.now(), friends: [User.last.to_c_json]} 
        assert_equal("planning3",Planning.last.title)
        assert_equal(["can't be blank"],JSON.parse(@response.body)["errors"]["title"])
        assert_equal(false,JSON.parse(@response.body)["success"])
    end

    test "updateValid" do 
        sign_in users(:one)
        assert_not_equal("planning test",Planning.first.title)
        patch "/api/plannings/1", params: {title: "planning test", date:DateTime.now(), friends: [User.last.to_c_json]} 
        assert_equal(JSON.parse(@response.body)["data"]["friends"][0]["id"],User.last.id)
        assert_equal("planning test",Planning.first.title)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "updateInvalidUser" do 
        assert_not_equal("planning test",Planning.first.title)
        patch "/api/plannings/1", params: {title: "planning test", date:DateTime.now(), friends: [User.last.to_c_json]} 
        assert_not_equal("planning test",Planning.first.title)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidUserId" do 
        sign_in users(:three)
        assert_not_equal("planning test",Planning.first.title)
        patch "/api/plannings/1", params: {title: "planning test", date:DateTime.now(), friends: [User.last.to_c_json]} 
        assert_not_equal("planning test",Planning.first.title)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Planning Found"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidInviteModifPlanning" do 
        sign_in users(:two)
        assert_not_equal("planning test",Planning.first.title)
        patch "/api/plannings/1", params: {title: "planning test", date:DateTime.now(), friends: [User.last.to_c_json]} 
        assert_not_equal("planning test",Planning.first.title)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Planning Found"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidPlanningId" do
        sign_in users(:one)
        assert_nil(Planning.find_by(id: 100))
        patch "/api/plannings/100", params: {title: "planning test", date:DateTime.now(), friends: [User.last.to_c_json]} 
        assert_nil(Planning.find_by(id: 100))
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Planning Found"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidDate" do
        sign_in users(:one)
        assert_not_equal("planning test",Planning.first.title)
        patch "/api/plannings/1", params: {title: "planning test", date: "2020-01-02 12:23:32", friends: [User.last.to_c_json]} 
        assert_not_equal("planning test",Planning.first.title)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["can't be in the past"],JSON.parse(@response.body)["errors"]["date"])
    end

    test "updateInvalidNoDate" do
        sign_in users(:one)
        assert_not_equal("planning test",Planning.first.title)
        patch "/api/plannings/1", params: {title: "planning test", date: "", friends: [User.last.to_c_json]} 
        assert_not_equal("planning test",Planning.first.title)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["can't be in the past"],JSON.parse(@response.body)["errors"]["date"])
    end

    test "updateInvalidWrongTitle" do 
        sign_in users(:one)
        assert_equal("planning1",Planning.first.title)
        patch "/api/plannings/1", params: {title: " ", date:DateTime.now(), friends: [User.last.to_c_json]} 
        assert_equal("planning1",Planning.first.title)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["can't be blank"],JSON.parse(@response.body)["errors"]["title"])
    end

    test "destroyValidCreator" do
        sign_in users(:one)
        planningToDestroy = Planning.first
        assert_equal(planningToDestroy.id,Planning.first.id)
        delete "/api/plannings/1", params: {id: 1} 
        assert_not_equal(planningToDestroy.id,Planning.first.id)
        assert_equal(true,JSON.parse(@response.body)["success"])
        sign_out users(:one)
        sign_in users(:two)
        assert_not_equal("planning1",Planning.first.title)
    end

    test "destroyValidUserIdInvit" do
        sign_in users(:two)
        planningToDestroy = Planning.first
        assert_equal(planningToDestroy.id,Planning.first.id)
        delete "/api/plannings/1", params: {id: 1} 
        assert_equal(planningToDestroy.id,Planning.first.id)
        assert_equal(true,JSON.parse(@response.body)["success"])
        sign_out users(:two)
        sign_in users(:one)
        assert_equal("planning1",Planning.first.title)
    end

    test "destroyInvalidUser" do 
        planningToDestroy = Planning.first
        assert_equal(planningToDestroy.id,Planning.first.id)
        delete "/api/plannings/1", params: {id: 1} 
        assert_equal(planningToDestroy.id,Planning.first.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "destroyInvalidUserNotInPlanning" do 
        sign_in users(:one)
        planningToDestroy = Planning.last
        assert_equal(planningToDestroy.id,Planning.last.id)
        delete "/api/plannings/3", params: {id: 3} 
        assert_equal(planningToDestroy.id,Planning.last.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Planning Found"],JSON.parse(@response.body)["errors"])
    end

    test "destroyInvalidPlanningId" do 
        sign_in users(:one)
        assert_nil(Planning.find_by(id: 100))
        delete "/api/plannings/100", params: {id: 100} 
        assert_nil(Planning.find_by(id: 100))
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Planning Found"],JSON.parse(@response.body)["errors"])
    end
    
end
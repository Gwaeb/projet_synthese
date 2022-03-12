require "test_helper"

class BuildsControllerTest < ActionDispatch::IntegrationTest

    include Devise::Test::IntegrationHelpers
    
    #rails test test/controllers/api/builds_controller.rb

    test "indexValid" do
        sign_in users(:one)
        get "/api/builds/"
        json = JSON.parse(@response.body)
        assert_equal("build1",json[0]["name"])
        assert_equal("build2",json[1]["name"])
    end

    test "indexInvalidUser" do
        get "/api/builds/"
        json = JSON.parse(@response.body)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "showValid" do
        sign_in users(:one)
        get "/api/builds/1"
        json = JSON.parse(@response.body)
        assert_equal("build1",json["name"])
    end
    
    test "showInvalidId" do
        sign_in users(:one)
        get "/api/builds/100"
        assert_equal("{}",@response.body)
    end

    test "showInvalidUser" do
        get "/api/builds/1"
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "createValid" do
        sign_in users(:one)
        assert_not_equal("build test",Build.last.name)
        post '/api/builds/',  params: {name:"build test", category: 2,items:[Item.first.to_json]}
        assert_equal("build test",Build.last.name)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "createInvalidUser" do
        assert_not_equal("build test",Build.last.name)
        post '/api/builds/',  params: {name:"build test", category: 2,items:[Item.first.to_json]}
        assert_not_equal("build test",Build.last.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidBuildNoName" do
        sign_in users(:one)
        assert_equal("build2",Build.second.name)
        post '/api/builds/',  params: { category: 2,items:[Item.first.to_json]}
        assert_equal("build2",Build.second.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["can't be blank", "is too short (minimum is 1 character)", "is too long (maximum is 255 characters)"],JSON.parse(@response.body)["errors"]["name"])
    end

    test "createInvalidBuildNoCategory" do
        sign_in users(:one)
        assert_equal("build2",Build.second.name)
        post '/api/builds/',  params: { name: "build de test",items:[Item.first.to_json]}
        assert_equal("build2",Build.second.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal({"category"=>["is not included in the list"]},JSON.parse(@response.body)["errors"])
    end

    test "createInvalidBuildWrongCategory" do
        sign_in users(:one)
        assert_equal("build2",Build.second.name)
        post '/api/builds/',  params: {name:"build test",category:19,items:[Item.first.to_json]}
        assert_equal("build2",Build.second.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal({"category"=>["is not included in the list"]},JSON.parse(@response.body)["errors"])
    end
    
    test "updateValid" do
        sign_in users(:one)
        assert_not_equal("build test", Build.first.name)
        patch '/api/builds/1',  params: {name:"build test", category: 2,items:[Item.first.to_json]}
        assert_equal("build test", Build.first.name)
        assert_equal(true,JSON.parse(@response.body)["success"]) 
    end

    test "updateInvalidUser" do
        assert_not_equal("build test", Build.first.name)
        patch '/api/builds/1',  params: {name:"build test", category: 2,items:[Item.first.to_json]}
        assert_not_equal("build test", Build.first.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidBuild" do
        sign_in users(:one)
        assert_not_equal("build test", Build.first.name)
        assert_not_equal("build test", Build.last.name)
        patch '/api/builds/999',  params: {name:"build test", category: 2,items:[Item.first.to_json]}
        assert_not_equal("build test", Build.first.name)
        assert_not_equal("build test", Build.last.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal("No Build Found",JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidBuildWrongName" do
        sign_in users(:one)
        assert_not_equal(1, Build.first.category)
        patch '/api/builds/1',  params: {name:" ", category: 1,items:[Item.first.to_json]}
        assert_not_equal(1, Build.first.category)
        assert_equal(false,JSON.parse(@response.body)["success"]) 
        assert_equal({"name"=>["can't be blank"]},JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidBuildMissingCategory" do
        sign_in users(:one)
        assert_not_equal("build test", Build.first.name)
        patch '/api/builds/1',  params: { name: "Build test",category: " ",items:[Item.first.to_json]}
        assert_not_equal("build test", Build.first.name)
        assert_equal(false,JSON.parse(@response.body)["success"]) 
        assert_equal({"category"=>["is not included in the list"]},JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidBuildWrongCategory" do
        sign_in users(:one)
        assert_not_equal("build test", Build.first.name)
        patch '/api/builds/1',  params: { name: "Build test",category: 9,items:[Item.first.to_json]}
        assert_not_equal("build test", Build.first.name)
        assert_equal(false,JSON.parse(@response.body)["success"]) 
        assert_equal({"category"=>["is not included in the list"]},JSON.parse(@response.body)["errors"])
    end

    test "destroyValid" do
        sign_in users(:one)
        buildToDelete = Build.first
        assert_equal(Build.first.id,buildToDelete.id)
        delete '/api/builds/1', params: {id: buildToDelete.id}
        assert_not_equal(Build.first.id,buildToDelete.id)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "destroyInvalidUser" do
        buildToDelete = Build.first
        assert_equal(Build.first.id,buildToDelete.id)
        delete '/api/builds/1', params: {id: buildToDelete.id}
        assert_equal(Build.first.id, buildToDelete.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "destroyInvalidBuild" do
        sign_in users(:one)
        assert_not_equal(Build.first.id,9999)
        assert_not_equal(Build.last.id,9999)
        delete '/api/builds/9999', params: {id: 9999}
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal("No Build Found",JSON.parse(@response.body)["errors"])
    end

    test "destroyInvalidUserList" do
        sign_in users(:two)
        buildToDelete = Build.first
        assert_equal(Build.first.id,buildToDelete.id)
        delete '/api/builds/1', params: {id: buildToDelete.id}
        assert_equal(Build.first.id, buildToDelete.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal("No Build Found",JSON.parse(@response.body)["errors"])
    end
end
require "test_helper"

class RunePagesControllerTest < ActionDispatch::IntegrationTest

    include Devise::Test::IntegrationHelpers
    
    #rails test test/controllers/api/rune_pages_controller.rb

    test "indexValid" do 
        sign_in users(:one)
        get "/api/rune_pages/"
        json = JSON.parse(@response.body)
        assert_equal("pagederune1",json[0]["name"])
        assert_equal("pagederune2",json[1]["name"])
    end

    test "indexInvalidUser" do 
        get "/api/rune_pages/"
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "showValid" do
        sign_in users(:one)
        get "/api/rune_pages/1"
        json = JSON.parse(@response.body)
        assert_equal("pagederune1",json["name"])
    end

    test "showInvalidUser" do
        get "/api/rune_pages/1"
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "showInvalidUserId" do
        sign_in users(:two)
        get "/api/rune_pages/1"
        assert_equal("{}",@response.body)
    end
    
    test "showInvalidId" do
        sign_in users(:one)
        assert_nil(RunePage.find_by(id: 100))
        get "/api/rune_pages/100"
        assert_equal("{}",@response.body)
    end

    test "createValid" do 
        sign_in users(:one)
        assert_not_equal("page test",RunePage.last.name)
        post '/api/rune_pages/',  params: {name:"page test",runes:[1,2,3,4,5,6,7,8,9]}
        assert_equal("page test",RunePage.last.name)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "createInvalidUser" do
        assert_not_equal("page test",RunePage.last.name)
        post '/api/rune_pages/',  params: {name:"page test",runes:[1,2,3,4,5,6,7,8,9]}
        assert_not_equal("page test",RunePage.last.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidPageNoName" do
        sign_in users(:one)
        assert_equal("pagederune3",RunePage.last.name)
        post '/api/rune_pages/',  params: {runes:[1,2,3,4,5,6,7,8,9]}
        assert_equal("pagederune3",RunePage.last.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["can't be blank", "is too short (minimum is 1 character)", "is too long (maximum is 255 characters)"],JSON.parse(@response.body)["errors"]["name"])
    end

    test "createInvalidPageWrongName" do
        sign_in users(:one)
        assert_equal("pagederune3",RunePage.last.name)
        post '/api/rune_pages/',  params: {name: " ",runes:[1,2,3,4,5,6,7,8,9]}
        assert_equal("pagederune3",RunePage.last.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["can't be blank"],JSON.parse(@response.body)["errors"]["name"])
    end

    test "createInvalidPageNoRune" do
        sign_in users(:one)
        assert_equal("pagederune3",RunePage.last.name)
        post '/api/rune_pages/',  params: {name: "page test"}
        assert_equal("pagederune3",RunePage.last.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Not Enought Runes"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidPageWrongRune" do
        sign_in users(:one)
        assert_equal("pagederune3",RunePage.last.name)
        post '/api/rune_pages/',  params: {name: "page test",runes:[1,2,3]}
        assert_equal("pagederune3",RunePage.last.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Not Enought Runes"],JSON.parse(@response.body)["errors"])
    end

    test "updateValid" do 
        sign_in users(:one)
        assert_not_equal("page test", RunePage.first.name)
        patch '/api/rune_pages/1',  params: {name:"page test",runes:[1,2,3,4,5,6,7,8,9]}
        assert_equal("page test", RunePage.first.name)
        assert_equal(true,JSON.parse(@response.body)["success"]) 
    end

    test "updateInvalidUser" do 
        assert_equal("pagederune1",RunePage.first.name)
        patch '/api/rune_pages/1',  params: {name:"page test",runes:[1,2,3,4,5,6,7,8,9]}
        assert_not_equal("page test",RunePage.first.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidUserId" do
        sign_in users(:two)
        assert_not_equal("page test", RunePage.first.name)
        patch '/api/rune_pages/1',  params: {name:"page test",runes:[1,2,3,4,5,6,7,8,9]}
        assert_not_equal("page test", RunePage.first.name)
        assert_equal(false,JSON.parse(@response.body)["success"]) 
        assert_equal(["No Page Found"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidPageId" do 
        sign_in users(:one)
        assert_nil(RunePage.find_by(id:100))
        patch '/api/rune_pages/100',  params: {name:"page test",runes:[1,2,3,4,5,6,7,8,9]}
        assert_nil(RunePage.find_by(id:100))
        assert_equal(["No Page Found"],JSON.parse(@response.body)["errors"])
        assert_equal(false,JSON.parse(@response.body)["success"])
    end

    test "updateInvalidName" do
        sign_in users(:one)
        assert_equal("pagederune1", RunePage.first.name)
        patch '/api/rune_pages/1',  params: {name:" ",runes:[1,2,3,4,5,6,7,8,9]}
        assert_equal("pagederune1", RunePage.first.name)
        assert_equal(false,JSON.parse(@response.body)["success"]) 
        assert_equal(["can't be blank"],JSON.parse(@response.body)["errors"]["name"])
    end

    test "updateInvalidRune" do 
        sign_in users(:one)
        assert_not_equal("page test", RunePage.first.name)
        patch '/api/rune_pages/1',  params: {name:"page test",runes:[1]}
        assert_not_equal("page test", RunePage.first.name)
        assert_equal(["Not Enought Rune"],JSON.parse(@response.body)["errors"])
        assert_equal(false,JSON.parse(@response.body)["success"]) 
    end

    test "updateInvalidMissingRune" do 
        sign_in users(:one)
        assert_not_equal("page test", RunePage.first.name)
        patch '/api/rune_pages/1',  params: {name:"page test",runes:[" "]}
        assert_not_equal("page test", RunePage.first.name)
        assert_equal(["Not Enought Rune"],JSON.parse(@response.body)["errors"])
        assert_equal(false,JSON.parse(@response.body)["success"]) 
    end

    test "destroyValid" do
        sign_in users(:one)
        pageToDelete = RunePage.first
        assert_equal(RunePage.first.id,pageToDelete.id)
        delete '/api/rune_pages/1', params: {id: pageToDelete.id}
        assert_not_equal(RunePage.first.id,pageToDelete.id)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "destroyInvalidUser" do
        pageToDelete = RunePage.first
        assert_equal(RunePage.first.id,pageToDelete.id)
        delete '/api/rune_pages/1', params: {id: pageToDelete.id}
        assert_equal(RunePage.first.id,pageToDelete.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "destroyInvalidUserId" do
        sign_in users(:two)
        pageToDelete = RunePage.first
        assert_equal(RunePage.first.id,pageToDelete.id)
        delete '/api/rune_pages/1', params: {id: pageToDelete.id}
        assert_equal(RunePage.first.id,pageToDelete.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Page Found"],JSON.parse(@response.body)["errors"])
    end

    test "destroyInvalidPageId" do
        sign_in users(:one)
        assert_nil(RunePage.find_by(id:100))
        delete '/api/rune_pages/100', params: {id: 100}
        assert_nil(RunePage.find_by(id:100))
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Page Found"],JSON.parse(@response.body)["errors"])
    end

end
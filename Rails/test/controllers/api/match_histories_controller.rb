require "test_helper"

class MatchHistoriesControllerTest < ActionDispatch::IntegrationTest

    include Devise::Test::IntegrationHelpers
    
    #rails test test/controllers/api/match_histories_controller.rb

    test "indexValid" do 
        sign_in users(:one)
        get "/api/match_histories/"
        json = JSON.parse(@response.body)
        assert_equal(1,json[0]["id"])
        assert_equal(true,json[0]["victory"])
        assert_equal(2,json[1]["id"])
        assert_equal(false,json[1]["victory"])
    end

    test "indexInvalidUser" do
        get "/api/match_histories/"
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "showValid" do
        sign_in users(:one)
        get "/api/match_histories/1"
        json = JSON.parse(@response.body)
        assert_equal(1,json["id"])
        assert_equal(true,json["victory"])
    end

    test "showInvalidUser" do
        get "/api/match_histories/1"
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "showInvalidUserId" do
        sign_in users(:two)
        get "/api/match_histories/1"
        assert_equal("{}",@response.body)
    end

    test "showInvalidMatchId" do
        sign_in users(:one)
        assert_nil(MatchHistory.find_by(id: 100))
        get "/api/match_histories/100"
        assert_equal("{}",@response.body)
    end

    test "createValid" do
        sign_in users(:one)
        assert_not_equal(3,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {position: 3, victory: true,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_equal(3,MatchHistory.last.position)
        assert_equal(6,MatchHistory.last.last_item)
        assert_equal(true,MatchHistory.last.victory)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "createInvalidUser" do
        assert_not_equal(3,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {position: 3, victory: true,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(3,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidMatchWrongPosition" do 
        sign_in users(:one)
        assert_not_equal(13,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {position: 13, victory: true,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(13,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["position"])
    end

    test "createInvalidMatchMissingPosition" do 
        sign_in users(:one)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {victory: true,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["position"])
    end

    test "createInvalidMatchMissingVictory" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        post "/api/match_histories/", params: {position: 4,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["victory"])
    end


    test "createInvalidMatchMissingChampion" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {position: 4,victory:true,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Champion Found"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidMatchWrongChampion" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_nil(Champion.find_by(id:100))
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {position: 4,victory:true,champion: Champion.find_by(id:100),build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Champion Found"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidMatchMissingBuild" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {position: 4,victory:true,champion: Champion.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Build Found"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidMatchWrongBuild" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_nil(Build.find_by(id:100))
        post "/api/match_histories/", params: {position: 4,victory:true,champion: Champion.first.to_json,build: Build.find_by(id:100),rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Build Found"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidMatchBuildToOtherUser" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_not_equal(1,Build.find_by(id: 3).user_id)
        post "/api/match_histories/", params: {position: 4,victory:true,champion: Champion.first.to_json,build: Build.find_by(id:3).to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["must exist"],JSON.parse(@response.body)["errors"]["build"])
    end

    test "createInvalidMatchMissingRunePage" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {position: 4,victory:true,champion: Champion.first.to_json,build: Build.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Rune Page Found"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidMatchWrongRunePage" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_nil(RunePage.find_by(id:100))
        post "/api/match_histories/", params: {position: 4,victory:true,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.find_by(id:100),last_item: 6}
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Rune Page Found"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidMatchRunePageToOtherUser" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_not_equal(1,RunePage.find_by(id: 3).user_id)
        post "/api/match_histories/", params: {position: 4,victory:true,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.find_by(id:3).to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.last.position)
        assert_not_equal(6,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["must exist"],JSON.parse(@response.body)["errors"]["rune_page"])
    end

    test "createInvalidMissingLastItem" do
        sign_in users(:one)
        assert_not_equal(3,MatchHistory.last.position)
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {position: 3, victory: true,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json}
        assert_not_equal(3,MatchHistory.last.position)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["last_item"])
    end

    test "createInvalidWrongLastItem" do
        sign_in users(:one)
        assert_not_equal(3,MatchHistory.last.position)
        assert_not_equal(16,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        post "/api/match_histories/", params: {position: 3, victory: true,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 16}
        assert_not_equal(3,MatchHistory.last.position)
        assert_not_equal(16,MatchHistory.last.last_item)
        assert_not_equal(true,MatchHistory.last.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["last_item"])
    end

    test "updateValid" do 
        sign_in users(:one)
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        patch "/api/match_histories/1", params: {position: 3, victory: false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_equal(3,MatchHistory.first.position)
        assert_equal(6,MatchHistory.first.last_item)
        assert_equal(false,MatchHistory.first.victory)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "updateInvalidUser" do
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        patch "/api/match_histories/1", params: {position: 3, victory: false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidUserId" do
        sign_in users(:two)
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        patch "/api/match_histories/1", params: {position: 3, victory: false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Match Found"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidMatchId" do
        sign_in users(:one)
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_nil(MatchHistory.find_by(id: 100))
        patch "/api/match_histories/100", params: {position: 3, victory: false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Match Found"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidWrongPosition" do 
        sign_in users(:one)
        assert_not_equal(13,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        patch "/api/match_histories/1", params: {position: 13, victory: false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(13,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["position"])
    end

    test "updateInvalidMissingPosition" do 
        sign_in users(:one)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        patch "/api/match_histories/1", params: {position: " ", victory: false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["position"])
    end

    test "updateInvalidWrongLastItem" do 
        sign_in users(:one)
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(16,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        patch "/api/match_histories/1", params: {position: 3, victory: false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 16}
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(16,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["last_item"])
    end

    test "updateInvalidMissingLastItem" do 
        sign_in users(:one)
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(false,MatchHistory.first.victory)
        patch "/api/match_histories/1", params: {position: 3, victory: false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: " "}
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["last_item"])
    end

    test "updateInvalidMissingVictory" do 
        sign_in users(:one)
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        patch "/api/match_histories/1", params: {position: 3, victory: "",champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(3,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["is not included in the list"],JSON.parse(@response.body)["errors"]["victory"])
    end

    test "updateInvalidWrongChampion" do 
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_nil(Champion.find_by(id:100))
        assert_not_equal(true,MatchHistory.last.victory)
        patch "/api/match_histories/1", params: {position: 4,victory:false,champion: Champion.find_by(id:100),build: Build.first.to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Champion Found"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidWrongBuild" do
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_nil(Build.find_by(id:100))
        patch "/api/match_histories/1", params: {position: 4,victory:false,champion: Champion.first.to_json,build: Build.find_by(id:100),rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Build Found"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidWrongBuildToOtherUser" do
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_not_equal(1,Build.find_by(id: 3).user_id)
        patch "/api/match_histories/1", params: {position: 4,victory:false,champion: Champion.first.to_json,build: Build.find_by(id:3).to_json,rune_page: RunePage.first.to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["must exist"],JSON.parse(@response.body)["errors"]["build"])
    end

    test "updateInvalidWrongRune" do
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_nil(RunePage.find_by(id:100))
        patch "/api/match_histories/1", params: {position: 4,victory:false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.find_by(id:100),last_item: 6}
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Rune Page Found"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidWrongRuneToOtherUser" do
        sign_in users(:one)
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_not_equal(1,RunePage.find_by(id: 3).user_id)
        patch "/api/match_histories/1", params: {position: 4,victory:false,champion: Champion.first.to_json,build: Build.first.to_json,rune_page: RunePage.find_by(id:3).to_json,last_item: 6}
        assert_not_equal(4,MatchHistory.first.position)
        assert_not_equal(6,MatchHistory.first.last_item)
        assert_not_equal(false,MatchHistory.first.victory)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["must exist"],JSON.parse(@response.body)["errors"]["rune_page"])
    end

    test "destroyValid" do
        sign_in users(:one)
        matchToDelete = MatchHistory.first
        assert_equal(MatchHistory.first.id,matchToDelete.id)
        delete '/api/match_histories/1', params: {id: matchToDelete.id}
        assert_not_equal(MatchHistory.first.id,matchToDelete.id)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "destroyInvalidUser" do 
        matchToDelete = MatchHistory.first
        assert_equal(MatchHistory.first.id,matchToDelete.id)
        delete '/api/match_histories/1', params: {id: matchToDelete.id}
        assert_equal(MatchHistory.first.id,matchToDelete.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end
    
    test "destroyInvalidUserId" do
        sign_in users(:two)
        matchToDelete = MatchHistory.first
        assert_equal(MatchHistory.first.id,matchToDelete.id)
        delete '/api/match_histories/1', params: {id: matchToDelete.id}
        assert_equal(MatchHistory.first.id,matchToDelete.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Match Found"],JSON.parse(@response.body)["errors"])
    end

    test "destroyInvalidMatchId" do 
        sign_in users(:one)
        assert_nil(MatchHistory.find_by(id:100))
        delete '/api/match_histories/100', params: {id: 100}
        assert_nil(MatchHistory.find_by(id:100))
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["No Match Found"],JSON.parse(@response.body)["errors"])
    end
    

end
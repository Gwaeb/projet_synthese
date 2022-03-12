require "test_helper"

class SkinWishlistsControllerTest < ActionDispatch::IntegrationTest

    include Devise::Test::IntegrationHelpers
    
    #rails test test/controllers/api/skin_wishlists_controller.rb

    test "indexValid" do
        sign_in users(:one)
        get "/api/skin_wishlists/"
        json = JSON.parse(@response.body)
        assert_equal("dyno",json[0]["skin"]["name"])
        assert_equal("thunder",json[1]["skin"]["name"])
    end

    test "indexInvalidUser" do
        get "/api/skin_wishlists/"
        json = JSON.parse(@response.body)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "showValid" do
        sign_in users(:one)
        get "/api/skin_wishlists/1"
        json = JSON.parse(@response.body)
        assert_equal("dyno",json["skin"]["name"])
    end
    
    test "showInvalidId" do
        sign_in users(:one)
        get "/api/skin_wishlists/100"
        assert_equal("{}",@response.body)
    end

    test "showInvalidUser" do
        get "/api/skin_wishlists/1"
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "createValid" do
        skinToAdd = skins(:three);
        sign_in users(:one)
        assert_not_equal(skinToAdd.name,SkinWishlist.last.skin.name)
        post '/api/skin_wishlists/', params: {id: skinToAdd.id}
        assert_equal(skinToAdd.name,SkinWishlist.last.skin.name)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "createInvalidUser" do
        skinToAdd = skins(:three);
        post '/api/skin_wishlists/', params: {id: skinToAdd.id}
        assert_not_equal(skinToAdd.name,SkinWishlist.last.skin.name)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "createInvalidSkin" do
        sign_in users(:one)
        post '/api/skin_wishlists/', params: {id: 9999999}
        assert_not_equal(9999999,SkinWishlist.last.skin.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal({"skin"=>["must exist"]},JSON.parse(@response.body)["errors"])
    end

    test "updateValid" do
        sign_in users(:one)
        skinToAdd = skins(:three)
        skinToEdit = SkinWishlist.first
        assert_not_equal(skinToEdit.skin.name,skinToAdd.name)
        patch '/api/skin_wishlists/3', params: {oldID: skinToEdit.skin.id}
        assert_equal(skinToAdd.name,SkinWishlist.first.skin.name)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "updateInvalidUser" do
        skinToAdd = skins(:three)
        skinToEdit = SkinWishlist.first
        assert_not_equal(skinToEdit.skin.name,skinToAdd.name)
        patch '/api/skin_wishlists/3', params: {oldID: skinToEdit.skin.id}
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_not_equal(skinToAdd.name,SkinWishlist.first.skin.name)
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidOldSkin" do
        sign_in users(:one)
        skinToAdd = skins(:three)
        assert_not_equal(99999,skinToAdd.id)
        patch '/api/skin_wishlists/3', params: {oldID: 99999}
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_not_equal(skinToAdd.name,SkinWishlist.first.skin.name)
        assert_not_equal(skinToAdd.name,SkinWishlist.last.skin.name)
        assert_equal("No Skins Found",JSON.parse(@response.body)["errors"])
    end

    test "updateInvalidNewSkin" do
        sign_in users(:one)
        skinToEdit = SkinWishlist.first
        assert_not_equal(skinToEdit.skin.id,99999)
        patch '/api/skin_wishlists/99999', params: {oldID: skinToEdit.skin.id}
        assert_not_equal(99999,SkinWishlist.first.skin.id)
        assert_not_equal(99999,SkinWishlist.last.skin.id)
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal("No Skins Found",JSON.parse(@response.body)["errors"])
    end

    test "destroyValid" do
        sign_in users(:one)
        skinToDelete = SkinWishlist.first.skin
        assert_equal(SkinWishlist.first.skin.id,skinToDelete.id)
        delete '/api/skin_wishlists/1', params: {id: skinToDelete.id}
        assert_not_equal(skinToDelete.id,SkinWishlist.first.skin.id)
        assert_equal(true,JSON.parse(@response.body)["success"])
    end

    test "destroyInvalidUser" do
        skinToDelete = SkinWishlist.first.skin
        assert_equal(SkinWishlist.first.skin.id,skinToDelete.id)
        delete '/api/skin_wishlists/1', params: {id: skinToDelete.id}
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(skinToDelete.id,SkinWishlist.first.skin.id)
        assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
    end

    test "destroyInvalidSkin" do
        sign_in users(:one)
        assert_not_equal(SkinWishlist.first.skin.id,99999)
        assert_not_equal(SkinWishlist.last.skin.id,99999)
        delete '/api/skin_wishlists/99999', params: {id: 99999}
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal("No Skins Found",JSON.parse(@response.body)["errors"])
    end

    test "destroyInvalidUserList" do
        sign_in users(:two)
        skinToDelete = SkinWishlist.first.skin
        assert_equal(skinToDelete.id,SkinWishlist.first.skin.id)
        delete '/api/skin_wishlists/1', params: {id: skinToDelete.id}
        assert_equal(false,JSON.parse(@response.body)["success"])
        assert_equal(skinToDelete.id,SkinWishlist.first.skin.id)
        assert_equal("No Skins Found",JSON.parse(@response.body)["errors"])
      end
    
end
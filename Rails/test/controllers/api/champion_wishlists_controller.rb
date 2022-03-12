require "test_helper"

class ChampionWishlistsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
    
  #rails test test/controllers/api/champion_wishlists_controller.rb

  test "indexValid" do
    sign_in users(:one)
    get "/api/champion_wishlists"
    json = JSON.parse(@response.body)
    assert_equal("Gnar",json[0]["champion"]["name"])
    assert_equal("Volibear",json[1]["champion"]["name"])
  end

  test "indexInvalidUser" do
    get "/api/champion_wishlists"
    json = JSON.parse(@response.body)
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
  end

  test "showValid" do
    sign_in users(:one)
    get "/api/champion_wishlists/1"
    json = JSON.parse(@response.body)
    assert_equal("Gnar",json["champion"]["name"])
  end

  test "showInvalidId" do
    sign_in users(:one)
    get "/api/champion_wishlists/100"
    assert_equal("{}",@response.body)
  end

  test "showInvalidUser" do
    get "/api/champion_wishlists/1"
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
  end

  test "createValid" do
    championToAdd = champions(:three);
    sign_in users(:one)
    assert_not_equal(championToAdd.name,ChampionWishlist.last.champion.name)
    post '/api/champion_wishlists/', params: {id: championToAdd.id}
    assert_equal(championToAdd.name,ChampionWishlist.last.champion.name)
    assert_equal(true,JSON.parse(@response.body)["success"])
  end

  test "createInvalidUser" do
    championToAdd = champions(:three);
    post '/api/champion_wishlists/', params: {id: championToAdd.id}
    assert_not_equal(championToAdd.name,ChampionWishlist.last.champion.name)
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
  end

  test "createInvalidChampion" do
    sign_in users(:one)
    post '/api/champion_wishlists/', params: {id: 9999999}
    assert_not_equal(9999999,ChampionWishlist.last.champion.id)
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_equal({"champion"=>["must exist"]},JSON.parse(@response.body)["errors"])
  end

  test "updateValid" do
    sign_in users(:one)
    championToAdd = champions(:three)
    championToEdit = ChampionWishlist.first
    assert_not_equal(championToEdit.champion.name,championToAdd.name)
    patch '/api/champion_wishlists/3', params: {oldID: championToEdit.champion.id}
    assert_equal(championToAdd.name,ChampionWishlist.first.champion.name)
    assert_equal(true,JSON.parse(@response.body)["success"])
  end

  test "updateInvalidUser" do
    championToAdd = champions(:three)
    championToEdit = ChampionWishlist.first
    assert_not_equal(championToEdit.champion.name,championToAdd.name)
    patch '/api/champion_wishlists/3', params: {oldID: championToEdit.champion.id}
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_not_equal(championToAdd.name,ChampionWishlist.first.champion.name)
    assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
  end

  test "updateInvalidOldChampion" do
    sign_in users(:one)
    championToAdd = champions(:three)
    assert_not_equal(99999,championToAdd.id)
    patch '/api/champion_wishlists/3', params: {oldID: 99999}
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_not_equal(championToAdd.name,ChampionWishlist.first.champion.name)
    assert_not_equal(championToAdd.name,ChampionWishlist.last.champion.name)
    assert_equal("No Champions Found",JSON.parse(@response.body)["errors"])
  end

  test "updateInvalidNewChampion" do
    sign_in users(:one)
    championToEdit = ChampionWishlist.first
    assert_not_equal(99999,championToEdit.champion.id)
    patch '/api/champion_wishlists/99999', params: {oldID: championToEdit.champion.id}
    assert_not_equal(99999,ChampionWishlist.first.champion.id)
    assert_not_equal(99999,ChampionWishlist.last.champion.id)
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_equal("No Champions Found",JSON.parse(@response.body)["errors"])
  end

  test "destroyValid" do
    sign_in users(:one)
    championToDelete = ChampionWishlist.first.champion
    assert_equal(championToDelete.id,ChampionWishlist.first.champion.id)
    delete '/api/champion_wishlists/1', params: {id: championToDelete.id}
    assert_not_equal(championToDelete.id,ChampionWishlist.first.champion.id)
    assert_equal(true,JSON.parse(@response.body)["success"])
  end

  test "destroyInvalidUser" do
    championToDelete = ChampionWishlist.first.champion
    assert_equal(championToDelete.id,ChampionWishlist.first.champion.id)
    delete '/api/champion_wishlists/1', params: {id: championToDelete.id}
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_equal(championToDelete.id,ChampionWishlist.first.champion.id)
    assert_equal(["Invalid login credentials"],JSON.parse(@response.body)["errors"])
  end

  test "destroyInvalidChampion" do
    sign_in users(:one)
    assert_not_equal(99999,ChampionWishlist.first.champion.id)
    assert_not_equal(99999,ChampionWishlist.last.champion.id)
    delete '/api/champion_wishlists/99999', params: {id: 99999}
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_equal("No Champions Found",JSON.parse(@response.body)["errors"])
  end

  test "destroyInvalidUserList" do
    sign_in users(:two)
    championToDelete = ChampionWishlist.first.champion
    assert_equal(championToDelete.id,ChampionWishlist.first.champion.id)
    delete '/api/champion_wishlists/1', params: {id: championToDelete.id}
    assert_equal(false,JSON.parse(@response.body)["success"])
    assert_equal(championToDelete.id,ChampionWishlist.first.champion.id)
    assert_equal("No Champions Found",JSON.parse(@response.body)["errors"])
  end

end
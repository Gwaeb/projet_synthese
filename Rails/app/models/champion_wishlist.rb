class ChampionWishlist < ApplicationRecord
    belongs_to :champion
    belongs_to :user

    def to_json
        self.as_json.merge(champion: self.champion.to_json)
    end
end

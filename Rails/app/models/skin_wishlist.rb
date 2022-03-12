class SkinWishlist < ApplicationRecord
    belongs_to :skin
    belongs_to :user
    
    def to_json
        self.as_json.merge(skin: self.skin.to_json)
    end

end

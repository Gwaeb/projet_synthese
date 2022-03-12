class Skin < ApplicationRecord
    has_one_attached :picture
    belongs_to :champion
    has_many :skin_wishlists, dependent: :destroy

    validates :name, presence: true,uniqueness: true, allow_blank: false, :length => {:within => 1..255}
    validates :price, numericality: { greater_than: 0 }
    
   

    def to_json
        self.as_json.merge(picture_path: rails_blob_path(self.picture, only_path: true),champion: self.champion.to_json)
    end
    
end

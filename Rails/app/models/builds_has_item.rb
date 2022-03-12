class BuildsHasItem < ApplicationRecord
    belongs_to :build
    belongs_to :item
end

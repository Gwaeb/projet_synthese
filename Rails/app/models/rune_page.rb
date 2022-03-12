class RunePage < ApplicationRecord
    belongs_to :user
    has_many :runes_has_runes_pages, dependent: :destroy
    has_many :runes, through: :runes_has_runes_pages, before_add: :validate_runes_limit
    has_many :match_histories, dependent: :destroy
    
    validates :name, presence: true, allow_blank: false, :length => {:within => 1..255}
    
    def to_json
        self.as_json.merge(runes: self.runes.map { |rune| rune.to_json}, categories: [self.runes.where(level: 0).first.category.to_json, self.runes.fifth.category.to_json], used: self.match_histories.count)
    end

    def validate_runes_limit(rune)
        raise Exception.new("too many runes") if self.runes.size >= 9
    end

end

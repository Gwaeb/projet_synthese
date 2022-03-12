class MatchHistory < ApplicationRecord

    extend ActionView::Helpers::DateHelper

    belongs_to :champion
    belongs_to :user
    belongs_to :rune_page
    belongs_to :build

    validates :position, :inclusion => 0..4
    validates :victory, inclusion: { in: [ true, false ] }
    validates :last_item, :inclusion => 0..6

    def to_json
        date_helpers = Class.new {include ActionView::Helpers::DateHelper}.new
        self.as_json.merge(champion: self.champion.to_json ,build: self.build.to_json,rune_page: self.rune_page.to_json, time_ago: date_helpers.time_ago_in_words(self.created_at))
    end
    
end

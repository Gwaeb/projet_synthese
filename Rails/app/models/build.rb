class Build < ApplicationRecord
    belongs_to :user
    has_many :builds_has_items, dependent: :destroy
    has_many :match_histories, dependent: :destroy
    has_many :items, through: :builds_has_items, before_add: :validate_items_limit

    
    
    validates :name, presence: true, allow_blank: false,:length => {:within => 1..255}
    validates :category, :inclusion => 0..5
    #validates_length_of :builds_has_items, maximum: 6

    def to_json
        self.as_json.merge(items: self.items.map { |item| item.to_json},used: self.match_histories.count)
    end

    def validate_items_limit(item)
        raise Exception.new("too many items") if self.items.size >= 6
    end

end

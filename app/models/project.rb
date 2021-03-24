class Project < ApplicationRecord
    scope :filter_by_difficulty, -> (difficulty) { where difficulty: difficulty }
    scope :filter_by_hook_size, -> (hook_size) { where hook_size: hook_size }
    scope :filter_by_yarn_size, -> (yarn_size) { where yarn_size: yarn_size }

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user
    has_one_attached :photo
    
    def self.search(search)
        where("name LIKE ?", "%#{search}%")
    end
end

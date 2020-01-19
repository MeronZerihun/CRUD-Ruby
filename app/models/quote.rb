class Quote < ApplicationRecord
    validates :authorName, presence: true
    validates :body, presence: true
end

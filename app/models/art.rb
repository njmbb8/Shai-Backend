class Art < ApplicationRecord
    has_one_attached :photo
    belongs_to :status
    has_many :order_items
    has_many :orders, through: :order_items
    validates :title, presence: true
end

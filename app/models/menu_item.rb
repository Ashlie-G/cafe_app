class MenuItem < ApplicationRecord
    attribute :price, default: 0.5
    attribute :quality, default: 1

    has_many :menu_menu_items
    has_many :menus, through: :menu_menu_items

    has_one_attached :image
end

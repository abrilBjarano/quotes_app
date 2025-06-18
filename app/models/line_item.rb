# app/models/line_item.rb
class LineItem < ApplicationRecord
  # ✨ ¡ESTA LÍNEA `has_many :line_items, dependent: :destroy` DEBE QUITARSE DE AQUÍ!
  belongs_to :line_item_date # Un LineItem pertenece a una LineItemDate

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  delegate :quote, to: :line_item_date
end
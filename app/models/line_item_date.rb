# app/models/line_item_date.rb
class LineItemDate < ApplicationRecord
  belongs_to :quote # Una LineItemDate pertenece a una Quote
  has_many :line_items, dependent: :destroy # ✨ ¡ESTA ES LA LÍNEA CLAVE QUE DEBE IR AQUÍ!

  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :asc) }

  def previous_date
    quote.line_item_dates.ordered.where("date < ?", date).last
  end
end
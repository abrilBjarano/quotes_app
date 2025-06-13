# app/models/quote.rb
class Quote < ApplicationRecord
  validates :name, presence: true

  # ✨ NUEVO: Este scope ordena las citas para que las más nuevas aparezcan primero.
  scope :ordered, -> { order(id: :desc) }
end
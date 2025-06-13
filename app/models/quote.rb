# app/models/quote.rb
class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # ✨ ¡NUEVO y CLAVE! Esta sola línea reemplaza TRES callbacks:
  #    - Cuando se crea: broadcast_prepend_later_to "quotes"
  #    - Cuando se actualiza: broadcast_replace_later_to "quotes"
  #    - Cuando se elimina: broadcast_remove_to "quotes"
  #    Lo hace de forma asíncrona (excepto remove) al canal "quotes" y prepende lo nuevo.
  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end
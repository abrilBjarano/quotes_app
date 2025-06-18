require "application_system_test_case"

class LineItemDatesTest < ApplicationSystemTestCase
  # ✨ ¡AGREGA ESTA LÍNEA AQUÍ PARA PODER USAR number_to_currency! ✨
  include ActionView::Helpers::NumberHelper

  setup do
    login_as users(:accountant)

    @quote          = quotes(:first)
    @line_item_date = line_item_dates(:today)
    # Si tus fixtures de line_item_dates:today tienen line_items, asegúrate de que se carguen también.
    # Por ejemplo, puedes cargar line_items también si no lo haces globalmente:
    # @line_item = line_items(:room_today) # Si today tiene room_today

    visit quote_path(@quote)
  end

  test "Creating a new line item date" do
    assert_selector "h1", text: "First quote"

    click_on "New date"
    assert_selector "h1", text: "First quote"
    fill_in "Date", with: Date.current + 1.day

    click_on "Create date"
    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test "Updating a line item date" do
    assert_selector "h1", text: "First quote"

    within id: dom_id(@line_item_date) do
      click_on "Edit"
    end

    assert_selector "h1", text: "First quote"

    fill_in "Date", with: Date.current + 1.day
    click_on "Update date"

    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test "Destroying a line item date" do
    assert_text I18n.l(Date.current, format: :long)

    # Nota: Para que este test funcione correctamente y el total_price se actualice
    # necesitas asegurarte de que @line_item_date tenga line_items asociados
    # en tus fixtures (test/fixtures/line_item_dates.yml y test/fixtures/line_items.yml)
    # y que la lógica del modelo Quote para total_price los considere.

    accept_confirm do
      within id: dom_id(@line_item_date) do
        click_on "Delete"
      end
    end

    assert_no_text I18n.l(Date.current, format: :long)
    assert_text number_to_currency(@quote.total_price) # ✨ ¡AGREGA ESTA LÍNEA AQUÍ!
  end
end
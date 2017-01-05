require 'rails_helper'

RSpec.feature do
  before do
    @category = create(:category_with_items)
    @item1 = @category.items.first
  end

  context 'visitor' do
    scenario 'deletes only item in cart' do
      visit items_path

      click_button("Add to Cart", match: :first)

      click_on "View Cart"

      click_button("Remove")

      expect(page).to have_content "Successfully removed #{@item1.name} from your cart."
      expect(page).to have_link @item1.name, item_path(@item1)
      expect(page).to_not have_content @item1.description
      expect(page).to_not have_content @ite1.price_per_unit
      expect(page).to have_content "Total Price: 0"
    end

    scenario 'deletes multiple items from cart' do
      visit items_path

      click_button("Add to Cart", match: :first)
      click_button("Add to Cart", match: :first)

      click_on "View Cart"

      click_button("Remove")

      expect(page).to have_content "Total Price: 0"
    end
  end
end
   
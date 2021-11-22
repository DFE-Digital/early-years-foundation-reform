# frozen_string_literal: true

module WithinTables
  # Use to test the values of columns for certain row
  #
  # Add <tt>offset</tt> to start matching at a certain column
  #
  #   %tr
  #     %td Hi
  #     %td Hello
  #     %td Hey
  #     %td Yo
  #     %td Bye
  #
  #   expect_within_table_row(1, 3, ['Hey', 'Yo'])
  #   expect_within_table_row(1, ['Hi', 'Hello', 'Hey', 'Yo', 'Bye'])
  #
  def expect_within_table_row(row = 1, offset = 1, attrs = [])
    # so you don't have to pass offset
    if offset.is_a?(Array)
      attrs = offset
      offset = 1
    end

    attrs.each.with_index(offset) do |att, index|
      within_row(row) do
        within_column(index) { expect(page).to have_content(att) }
      end
    end
  end

  # Used like capybara <tt>within()</tt> selector
  #
  #   within_row(3) do
  #     expect(page).to have_content('Hey')
  #   end
  #
  def within_row(row, &block)
    within(:xpath, ".//table/tbody/tr[#{row}]", &block)
  end

  # Used like capybara <tt>within()</tt> selector but should be used inside another
  # <tt>within*</tt> selector. Beware raising ambiguous error if multiple <tt>td</tt>
  # dom elements inside initial <tt>within*</tt> selector
  #
  #   within('#table') do
  #     within_column(2) do
  #       expect(page).to have_content('Hey')
  #     end
  #   end
  def within_column(column, &block)
    within(:xpath, ".//td[#{column}]", &block)
  end
end

RSpec.configure do |config|
  config.include WithinTables
end

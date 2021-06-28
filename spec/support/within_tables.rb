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
  
    # Use to test a single cell in a table
    #
    #   %table
    #     %tr
    #       %td One
    #       %td Two
    #       %td Three
    #     %tr
    #       %td 1
    #       %td 2
    #       %td 3
    #
    #   within_cell(2, 3) { expect(page).to have_content(2) }
    #
    def within_cell(row, column, table = nil)
      within_row(row, table) do
        within_column(column) { yield }
      end
    end
  
    # Used like capybara <tt>within()</tt> selector
    #
    #   within_row(1, '#table-id') do
    #     expect(page).to have_content('Yolo')
    #   end
    #
    #   within_row(3) do
    #     expect(page).to have_content('Hey')
    #   end
    #
    def within_row(row, table = nil)
      if table
        within(table) do
          within(:xpath, ".//tbody/tr[#{row}]") { yield }
        end
      else
        within(:xpath, ".//table/tbody/tr[#{row}]") { yield }
      end
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
    def within_column(column)
      within(:xpath, ".//td[#{column}]") { yield }
    end
  
    # Find within a table in the column with th header.
    def within_column_name(header)
      within(:xpath, "//table/tbody/tr/td[count(//table/thead/tr/th[normalize-space()=\"#{header}\"]/preceding-sibling::th)+1]") do
        yield
      end
    end
  
    # Find within row that has cell with content.
    def within_row_with_cell(content)
      within(:xpath, "//tr[td=\"#{content}\"]") { yield }
    end
  end
  
  RSpec.configure do |config|
    config.include WithinTables
  end
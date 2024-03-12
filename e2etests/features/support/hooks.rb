# frozen_string_literal:true

After do |scenario|
  if scenario.name.downcase.include?('accessibility')
    puts ''
    puts '- - - - - - - - - - - - -'
    puts "Scenario: #{scenario.name}"
    steps %(Then the page should be accessible)
    puts '- - - - - - - - - - - - -'
  end
end

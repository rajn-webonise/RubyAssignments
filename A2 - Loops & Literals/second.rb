# START OF PROGRAM
puts "Enter number of test cases:"
test_cases = gets.chomp.to_i

test_cases.times do |test_case|
  puts "Test case ##{test_case+1}", "Enter 2 strings: "
  # Create character arrays of both strings.
  first_string_array = gets.chomp.split(//)
  second_string_array = gets.chomp.split(//)

  # Check if values of both arrays intersect (using &).
  # If even a single character intersects, then it's a valid substring.
  if (first_string_array & second_string_array).length > 0
    puts "YES"
  else
    puts "NO"
  end
end

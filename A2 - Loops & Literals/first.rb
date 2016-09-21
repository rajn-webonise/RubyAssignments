# Returns sum of values in list
def sum(list)
  list.reduce(&:+).to_i
end

# Checks if given list is valid (has a divider point where sum of both parts are equal?)
def valid?(list)
  # Divider divides the list into left and right.
  # Divider's value ranges from 0..length+1 to ensure all possible combinations are tried.
  (list.length).times do |divider|
    # Filter left and right lists, by comparing value of divider with index. Then, compare their sums.
    left_list = list.select.with_index{|val,index| index<divider }
    right_list = list.select.with_index{|val,index| index>divider }
    return true if sum(left_list)==sum(right_list)
  end
  return false
end

# START OF PROGRAM
puts "Enter number of test cases:"
test_cases = gets.chomp.to_i

test_cases.times do |test_case|
  puts "Test case ##{test_case+1}", "Enter a list of numbers: "
  list = gets.chomp.split(' ').map(&:to_i)

  if valid?(list)
    puts "YES"
  else
    puts "NO"
  end
end
